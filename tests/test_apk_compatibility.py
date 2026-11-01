import hashlib
import os
import struct
import subprocess
import zipfile
import unittest

REPO_ROOT = r"C:\Koding\rea\pocket"
DECOMPILED_DIR = os.path.join(REPO_ROOT, "pocket-heroes-decompiled")
TOOLS_DIR = os.path.join(REPO_ROOT, "tools")
KEYSTORE_PATH = os.path.join(TOOLS_DIR, "release.keystore")
OUTPUT_APK = os.path.join(REPO_ROOT, "pocket-heroes-2-0-5-android13-fixed.apk")
KEYTOOL_EXE = r"C:\Program Files\Android\Android Studio\jbr\bin\keytool.exe"
SDK_BUILD_TOOLS = r"C:\Users\Colorful\AppData\Local\Android\Sdk\build-tools\36.1.0"
AAPT2_EXE = os.path.join(SDK_BUILD_TOOLS, "aapt2.exe")
APKSIGNER_BAT = os.path.join(SDK_BUILD_TOOLS, "apksigner.bat")


def get_keystore_cert_md5() -> bytes:
    der = subprocess.run(
        [
            KEYTOOL_EXE,
            "-exportcert",
            "-keystore",
            KEYSTORE_PATH,
            "-alias",
            "pocketheroes",
            "-storepass",
            "android123",
        ],
        capture_output=True,
        check=True,
    ).stdout
    return hashlib.md5(der).hexdigest().lower().encode("ascii")


def has_textrel(elf_bytes: bytes) -> bool:
    e_phoff, _, _, _, e_phentsize, e_phnum = struct.unpack_from("<IIIHHH", elf_bytes, 28)
    dyn_off, dyn_sz = 0, 0
    for i in range(e_phnum):
        p_type, p_offset, _, _, p_filesz, _, _, _ = struct.unpack_from(
            "<IIIIIIII", elf_bytes, e_phoff + i * e_phentsize
        )
        if p_type == 2:  # PT_DYNAMIC
            dyn_off, dyn_sz = p_offset, p_filesz
    for pos in range(dyn_off, dyn_off + dyn_sz, 8):
        d_tag, d_val = struct.unpack_from("<iI", elf_bytes, pos)
        if d_tag == 0:
            break
        if d_tag == 22 or (d_tag == 30 and (d_val & 0x4)):
            return True
    return False


class TestPocketHeroesAndroid13Port(unittest.TestCase):
    def test_apktool_yml_target_sdk_is_modern(self):
        yml_path = os.path.join(DECOMPILED_DIR, "apktool.yml")
        with open(yml_path, "r", encoding="utf-8") as f:
            content = f.read()
        self.assertIn("targetSdkVersion: 33", content)

    def test_manifest_has_http_legacy_and_cleartext_and_exported(self):
        manifest_path = os.path.join(DECOMPILED_DIR, "AndroidManifest.xml")
        with open(manifest_path, "r", encoding="utf-8") as f:
            xml = f.read()
        self.assertIn('platformBuildVersionCode="33"', xml)
        self.assertIn('android:requestLegacyExternalStorage="true"', xml)
        self.assertIn('android:name="org.apache.http.legacy"', xml)
        self.assertIn('android:usesCleartextTraffic="true"', xml)
        self.assertIn('android:name=".GameActivity"', xml)
        self.assertIn('android:exported="true"', xml)
        self.assertNotIn('android.permission.READ_PHONE_STATE', xml)
        self.assertIn(
            'android:enabled="false" android:exported="false" android:name="com.inmobi.commons.analytics.androidsdk.IMAdTrackerReceiver"',
            xml,
        )
        self.assertIn(
            'android:enabled="false" android:exported="false" android:name="com.droidhang.referrer.DroidhangReceiver"',
            xml,
        )

    def test_native_libs_include_armeabi_v7a_and_no_textrel_libs(self):
        v7a_game = os.path.join(DECOMPILED_DIR, "lib", "armeabi-v7a", "libgame.so")
        self.assertTrue(os.path.isfile(v7a_game), "lib/armeabi-v7a/libgame.so must exist")
        expected_md5 = get_keystore_cert_md5()
        for abi in ("armeabi", "armeabi-v7a"):
            abi_dir = os.path.join(DECOMPILED_DIR, "lib", abi)
            for fn in os.listdir(abi_dir):
                self.assertEqual(fn, "libgame.so", f"Unexpected TEXTREL library {fn} in {abi}")
            so_path = os.path.join(abi_dir, "libgame.so")
            with open(so_path, "rb") as f:
                data = f.read()
            # verify() at 0x0023af74 -> bx lr (70 47)
            self.assertEqual(data[0x0023AF74:0x0023AF76], b"\x70\x47")
            # AndroidUtil::verifySignature() at 0x0035bbac -> bx lr (70 47)
            self.assertEqual(data[0x0035BBAC:0x0035BBAE], b"\x70\x47")
            # DHHttpHelper::login() at 0x003614cc -> bx lr (70 47)
            self.assertEqual(data[0x003614CC:0x003614CE], b"\x70\x47")
            # Expected cert MD5 at 0x006215b8 matches release.keystore
            self.assertEqual(data[0x006215B8:0x006215B8 + 32], expected_md5)

    def test_smali_startup_crashes_and_popups_neutralized(self):
        game_act = os.path.join(
            DECOMPILED_DIR, "smali", "com", "droidhang", "ph", "GameActivity.smali"
        )
        with open(game_act, "r", encoding="utf-8") as f:
            smali = f.read()
        self.assertNotIn("Lcom/tapjoy/TapjoyConnect;->requestTapjoyConnect", smali)
        self.assertNotIn("Lcom/sponsorpay/SponsorPay;->start", smali)
        self.assertNotIn("Lcom/droidhang/game/DHGames;->init", smali)
        self.assertNotIn("Lcom/droidhang/crosspromotion/CrossPromotionUtil;->init", smali)
        self.assertNotIn("Lcom/hz/game/be/util/AdMgr;->enable", smali)

        helper_path = os.path.join(
            DECOMPILED_DIR,
            "smali",
            "com",
            "google",
            "example",
            "games",
            "basegameutils",
            "GameHelper.smali",
        )
        with open(helper_path, "r", encoding="utf-8") as f:
            helper_smali = f.read()
        self.assertIn("iput-boolean v2, p0, Lcom/google/example/games/basegameutils/GameHelper;->mConnectOnStart:Z", helper_smali)
        self.assertIn("iput-boolean v2, p0, Lcom/google/example/games/basegameutils/GameHelper;->mShowErrorDialogs:Z", helper_smali)

        be_util_path = os.path.join(
            DECOMPILED_DIR, "smali", "com", "hz", "game", "be", "util", "BEUtil.smali"
        )
        with open(be_util_path, "r", encoding="utf-8") as f:
            be_smali = f.read()
        self.assertNotIn("Lcom/droidhang/game/ad/VideoAdManager;->isAdReady()Z", be_smali)
        self.assertNotIn("Lcom/droidhang/game/ad/VideoAdManager;->playAd()V", be_smali)
        self.assertNotIn("/data/data/com.hz.game.be/", be_smali)

        video_mgr_path = os.path.join(
            DECOMPILED_DIR, "smali", "com", "droidhang", "game", "ad", "VideoAdManager.smali"
        )
        with open(video_mgr_path, "r", encoding="utf-8") as f:
            video_smali = f.read()
        self.assertNotIn("Lcom/droidhang/game/ad/VideoLimitManager;->shouldDisplay", video_smali)

        android_util_path = os.path.join(
            DECOMPILED_DIR, "smali", "com", "wwcd", "util", "AndroidUtil.smali"
        )
        with open(android_util_path, "r", encoding="utf-8") as f:
            au_smali = f.read()
        self.assertNotIn("Landroid/net/wifi/WifiInfo;->getMacAddress()Ljava/lang/String;", au_smali)
        self.assertNotIn("Landroid/telephony/TelephonyManager;->getDeviceId()Ljava/lang/String;", au_smali)
        self.assertNotIn("Landroid/telephony/TelephonyManager;->getSubscriberId()Ljava/lang/String;", au_smali)

    def test_built_and_signed_apk_is_valid_for_android_13_plus(self):
        self.assertTrue(os.path.isfile(OUTPUT_APK), "Fixed APK has not been built yet")
        expected_md5 = get_keystore_cert_md5()
        with zipfile.ZipFile(OUTPUT_APK, "r") as z:
            names = set(z.namelist())
            self.assertIn("lib/armeabi-v7a/libgame.so", names)
            self.assertIn("lib/armeabi/libgame.so", names)
            self.assertNotIn("lib/armeabi/libbspatch.so", names)
            self.assertNotIn("lib/armeabi/libgetuiext.so", names)
            for name in names:
                if name.endswith(".so"):
                    so_bytes = z.read(name)
                    self.assertFalse(has_textrel(so_bytes), f"{name} has DT_TEXTREL")
                    self.assertEqual(so_bytes[0x0023AF74:0x0023AF76], b"\x70\x47")
                    self.assertEqual(so_bytes[0x0035BBAC:0x0035BBAE], b"\x70\x47")
                    self.assertEqual(so_bytes[0x003614CC:0x003614CE], b"\x70\x47")
                    self.assertEqual(so_bytes[0x006215B8:0x006215B8 + 32], expected_md5)

        # Verify with aapt2 dump badging
        badging = subprocess.run(
            [AAPT2_EXE, "dump", "badging", OUTPUT_APK],
            capture_output=True,
            text=True,
            encoding="utf-8",
            errors="replace",
            check=True,
        ).stdout
        self.assertIn("targetSdkVersion:'33'", badging)
        self.assertIn("armeabi-v7a", badging)

        # Verify signature schemes v1 and v2/v3 with apksigner
        sig = subprocess.run(
            [APKSIGNER_BAT, "verify", "--verbose", OUTPUT_APK],
            capture_output=True,
            text=True,
            encoding="utf-8",
            errors="replace",
            check=True,
        ).stdout
        self.assertIn("Verified using v1 scheme (JAR signing): true", sig)
        self.assertIn("Verified using v2 scheme (APK Signature Scheme v2): true", sig)


if __name__ == "__main__":
    unittest.main()
