import hashlib
import os
import re
import shutil
import subprocess

REPO_ROOT = r"C:\Koding\rea\pocket"
DECOMPILED_DIR = os.path.join(REPO_ROOT, "pocket-heroes-decompiled")
TOOLS_DIR = os.path.join(REPO_ROOT, "tools")
APKTOOL_JAR = os.path.join(TOOLS_DIR, "apktool.jar")
JAVA_EXE = r"C:\Program Files\Android\Android Studio\jbr\bin\java.exe"
KEYTOOL_EXE = r"C:\Program Files\Android\Android Studio\jbr\bin\keytool.exe"
SDK_BUILD_TOOLS = r"C:\Users\Colorful\AppData\Local\Android\Sdk\build-tools\36.1.0"
ZIPALIGN_EXE = os.path.join(SDK_BUILD_TOOLS, "zipalign.exe")
APKSIGNER_BAT = os.path.join(SDK_BUILD_TOOLS, "apksigner.bat")

UNSIGNED_APK = os.path.join(TOOLS_DIR, "unsigned.apk")
ALIGNED_APK = os.path.join(TOOLS_DIR, "aligned.apk")
KEYSTORE_PATH = os.path.join(TOOLS_DIR, "release.keystore")
OUTPUT_APK = os.path.join(REPO_ROOT, "pocket-heroes-2-0-5-android13-fixed.apk")


def ensure_keystore():
    os.makedirs(TOOLS_DIR, exist_ok=True)
    if not os.path.exists(KEYSTORE_PATH):
        print("Generating signing keystore...")
        subprocess.run(
            [
                KEYTOOL_EXE,
                "-genkeypair",
                "-v",
                "-keystore",
                KEYSTORE_PATH,
                "-alias",
                "pocketheroes",
                "-keyalg",
                "RSA",
                "-keysize",
                "2048",
                "-validity",
                "10000",
                "-storepass",
                "android123",
                "-keypass",
                "android123",
                "-dname",
                "CN=PocketHeroesPort, OU=Android13Compat, O=Community, L=ID, S=ID, C=ID",
            ],
            check=True,
        )


def get_keystore_cert_md5() -> bytes:
    ensure_keystore()
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
    md5_hex = hashlib.md5(der).hexdigest().lower().encode("ascii")
    assert len(md5_hex) == 32
    return md5_hex


def patch_apktool_yml():
    yml_path = os.path.join(DECOMPILED_DIR, "apktool.yml")
    with open(yml_path, "r", encoding="utf-8") as f:
        text = f.read()
    text = re.sub(r"targetSdkVersion:\s*\d+", "targetSdkVersion: 33", text)
    with open(yml_path, "w", encoding="utf-8", newline="\n") as f:
        f.write(text)


def patch_manifest():
    manifest_path = os.path.join(DECOMPILED_DIR, "AndroidManifest.xml")
    with open(manifest_path, "r", encoding="utf-8") as f:
        xml = f.read().replace("\r\n", "\n")

    xml = re.sub(r'platformBuildVersionCode="\d+"', 'platformBuildVersionCode="33"', xml)
    xml = re.sub(r'platformBuildVersionName="[^"]+"', 'platformBuildVersionName="13"', xml)

    if 'android:requestLegacyExternalStorage="true"' not in xml:
        xml = xml.replace(
            'android:usesCleartextTraffic="true"',
            'android:requestLegacyExternalStorage="true" android:usesCleartextTraffic="true"',
        )

    xml = xml.replace(
        '<receiver android:enabled="true" android:exported="true" android:name="com.inmobi.commons.analytics.androidsdk.IMAdTrackerReceiver">',
        '<receiver android:enabled="false" android:exported="false" android:name="com.inmobi.commons.analytics.androidsdk.IMAdTrackerReceiver">',
    )
    xml = xml.replace(
        '<service android:enabled="true" android:name="com.inmobi.commons.internal.ActivityRecognitionManager"/>',
        '<service android:enabled="false" android:exported="false" android:name="com.inmobi.commons.internal.ActivityRecognitionManager"/>',
    )
    xml = xml.replace(
        '<service android:exported="false" android:name="com.vungle.publisher.VungleService"/>',
        '<service android:enabled="false" android:exported="false" android:name="com.vungle.publisher.VungleService"/>',
    )
    xml = xml.replace(
        '<receiver android:exported="true" android:name="com.droidhang.referrer.DroidhangReceiver">',
        '<receiver android:enabled="false" android:exported="false" android:name="com.droidhang.referrer.DroidhangReceiver">',
    )

    with open(manifest_path, "w", encoding="utf-8", newline="\n") as f:
        f.write(xml)


def patch_native_libs():
    armeabi_dir = os.path.join(DECOMPILED_DIR, "lib", "armeabi")
    v7a_dir = os.path.join(DECOMPILED_DIR, "lib", "armeabi-v7a")
    os.makedirs(v7a_dir, exist_ok=True)

    # Remove unused legacy libraries that contain DT_TEXTREL
    for bad_lib in ("libbspatch.so", "libgetuiext.so"):
        p = os.path.join(armeabi_dir, bad_lib)
        if os.path.exists(p):
            os.remove(p)

    src_game = os.path.join(armeabi_dir, "libgame.so")
    with open(src_game, "rb") as f:
        so_data = bytearray(f.read())

    # 1. Neutralize verify(void) at 0x0023AF74 -> bx lr (70 47)
    so_data[0x0023AF74:0x0023AF76] = b"\x70\x47"
    # 2. Neutralize AndroidUtil::verifySignature(void) at 0x0035BBAC -> bx lr (70 47)
    so_data[0x0035BBAC:0x0035BBAE] = b"\x70\x47"
    # 3. Neutralize DHHttpHelper::login(void) at 0x003614CC -> bx lr (70 47)
    so_data[0x003614CC:0x003614CE] = b"\x70\x47"
    # 4. Update expected certificate MD5 at 0x006215B8 to match release.keystore
    cert_md5 = get_keystore_cert_md5()
    so_data[0x006215B8:0x006215B8 + 32] = cert_md5

    with open(src_game, "wb") as f:
        f.write(so_data)

    dst_game = os.path.join(v7a_dir, "libgame.so")
    shutil.copy2(src_game, dst_game)


def replace_smali_method(smali_text: str, method_header: str, new_body: str) -> str:
    pattern = re.compile(
        r"(" + re.escape(method_header) + r"\n)(.*?)(\n\.end method)",
        re.DOTALL,
    )
    replaced, count = pattern.subn(r"\1" + new_body + r"\3", smali_text, count=1)
    assert count == 1, f"Failed to replace method: {method_header}"
    return replaced


def patch_smali_files():
    # 1. Patch GameActivity.smali
    game_act_path = os.path.join(
        DECOMPILED_DIR, "smali", "com", "droidhang", "ph", "GameActivity.smali"
    )
    with open(game_act_path, "r", encoding="utf-8") as f:
        ga = f.read().replace("\r\n", "\n")

    lines_to_comment = [
        "invoke-static {p0}, Lcom/umeng/analytics/MobclickAgent;->updateOnlineConfig(Landroid/content/Context;)V",
        "invoke-static {p0, v1}, Lcom/hz/game/be/sns/DHFacebook;->printKeyHash(Landroid/app/Activity;Ljava/lang/String;)V",
        "invoke-static {p0, v1, v2}, Lcom/tapjoy/TapjoyConnect;->requestTapjoyConnect(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z",
        "invoke-static {p0, p0, p0}, Lcom/droidhang/game/DHGames;->init(Landroid/app/Activity;Lcom/droidhang/game/ad/IAdId;Lcom/droidhang/game/ad/video/VideoAdCallback;)V",
        "invoke-static {p0, v1}, Lcom/droidhang/crosspromotion/CrossPromotionUtil;->init(Landroid/app/Activity;Landroid/widget/FrameLayout;)V",
        "invoke-static {p0, v1}, Lcom/hz/game/be/util/AdMgr;->init(Landroid/app/Activity;Landroid/widget/RelativeLayout;)V",
        "invoke-static {p0, v5, v5}, Lcom/hz/game/be/util/AdMgr;->enable(Landroid/app/Activity;II)V",
        "invoke-static {}, Lcom/droidhang/game/ad/VideoAdManager;->onPause()V",
        "invoke-virtual {v0}, Lcom/tapjoy/TapjoyConnect;->appPause()V",
        "invoke-static {}, Lcom/droidhang/game/ad/VideoAdManager;->onResume()V",
        "invoke-virtual {v1, p0}, Lcom/tapjoy/TapjoyConnect;->getTapPoints(Lcom/tapjoy/TapjoyNotifier;)V",
        "invoke-virtual {v1}, Lcom/tapjoy/TapjoyConnect;->appResume()V",
        "invoke-static {v1, v2, v3, p0}, Lcom/sponsorpay/SponsorPay;->start(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/Activity;)Ljava/lang/String;",
    ]
    for target in lines_to_comment:
        ga = ga.replace(target, "# " + target.replace("->", "->noop_"))

    with open(game_act_path, "w", encoding="utf-8", newline="\n") as f:
        f.write(ga)

    # 2. Patch DHGooglePaymentManager.smali so init() marks supportPurchase=false safely offline
    pay_path = os.path.join(
        DECOMPILED_DIR,
        "smali",
        "com",
        "droidhang",
        "pay",
        "DHGooglePaymentManager.smali",
    )
    with open(pay_path, "r", encoding="utf-8") as f:
        pay = f.read().replace("\r\n", "\n")

    pay = pay.replace(
        "invoke-direct {p0}, Lcom/droidhang/pay/DHGooglePaymentManager;->initPurchase()V",
        "const/4 v0, 0x0\n    iput-boolean v0, p0, Lcom/droidhang/pay/DHGooglePaymentManager;->supportPurchase:Z",
    )
    with open(pay_path, "w", encoding="utf-8", newline="\n") as f:
        f.write(pay)

    # 3. Patch GameHelper.smali to disable auto Google Play Games sign-in & error dialogs on startup
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
        helper = f.read().replace("\r\n", "\n")

    helper = helper.replace(
        "iput-boolean v3, p0, Lcom/google/example/games/basegameutils/GameHelper;->mConnectOnStart:Z",
        "iput-boolean v2, p0, Lcom/google/example/games/basegameutils/GameHelper;->mConnectOnStart:Z",
    )
    helper = helper.replace(
        "iput-boolean v3, p0, Lcom/google/example/games/basegameutils/GameHelper;->mShowErrorDialogs:Z",
        "iput-boolean v2, p0, Lcom/google/example/games/basegameutils/GameHelper;->mShowErrorDialogs:Z",
    )
    with open(helper_path, "w", encoding="utf-8", newline="\n") as f:
        f.write(helper)

    # 4. Patch BEUtil.smali to avoid VideoAdManager / Tapjoy NPEs when called from JNI
    be_util_path = os.path.join(
        DECOMPILED_DIR, "smali", "com", "hz", "game", "be", "util", "BEUtil.smali"
    )
    with open(be_util_path, "r", encoding="utf-8") as f:
        be_smali = f.read().replace("\r\n", "\n")

    be_smali = be_smali.replace("com.hz.game.be", "com.droidhang.ph")
    be_smali = replace_smali_method(
        be_smali,
        ".method public static isVideoAdAvailable()I",
        "    .locals 1\n    const/4 v0, 0x0\n    return v0",
    )
    be_smali = replace_smali_method(
        be_smali,
        ".method public static playVideoAd()V",
        "    .locals 0\n    return-void",
    )
    be_smali = replace_smali_method(
        be_smali,
        ".method public static openOfferWall()V",
        "    .locals 0\n    return-void",
    )
    with open(be_util_path, "w", encoding="utf-8", newline="\n") as f:
        f.write(be_smali)

    # 5. Patch VideoAdManager.smali so all ad checks / lifecycle calls are safe no-ops
    video_mgr_path = os.path.join(
        DECOMPILED_DIR, "smali", "com", "droidhang", "game", "ad", "VideoAdManager.smali"
    )
    with open(video_mgr_path, "r", encoding="utf-8") as f:
        video_smali = f.read().replace("\r\n", "\n")

    video_smali = replace_smali_method(
        video_smali,
        ".method public static isAdReady()Z",
        "    .locals 1\n    const/4 v0, 0x0\n    return v0",
    )
    video_smali = replace_smali_method(
        video_smali,
        ".method public static isAdReady(Ljava/lang/String;)Z",
        "    .locals 1\n    .param p0, \"key\"    # Ljava/lang/String;\n    const/4 v0, 0x0\n    return v0",
    )
    video_smali = replace_smali_method(
        video_smali,
        ".method public static onPause()V",
        "    .locals 0\n    return-void",
    )
    video_smali = replace_smali_method(
        video_smali,
        ".method public static onResume()V",
        "    .locals 0\n    return-void",
    )
    video_smali = replace_smali_method(
        video_smali,
        ".method public static playAd()V",
        "    .locals 0\n    return-void",
    )
    video_smali = replace_smali_method(
        video_smali,
        ".method public static playAd(Ljava/lang/String;)V",
        "    .locals 0\n    .param p0, \"key\"    # Ljava/lang/String;\n    return-void",
    )
    with open(video_mgr_path, "w", encoding="utf-8", newline="\n") as f:
        f.write(video_smali)

    # 6. Patch AndroidUtil.smali so getIMEI, getIMSI, getWIFI never crash on Android 13/14
    android_util_path = os.path.join(
        DECOMPILED_DIR, "smali", "com", "wwcd", "util", "AndroidUtil.smali"
    )
    with open(android_util_path, "r", encoding="utf-8") as f:
        au_smali = f.read().replace("\r\n", "\n")

    au_smali = replace_smali_method(
        au_smali,
        ".method public static getIMEI(Landroid/content/Context;)Ljava/lang/String;",
        "    .locals 1\n    .param p0, \"ctx\"    # Landroid/content/Context;\n    const-string v0, \"\"\n    return-object v0",
    )
    au_smali = replace_smali_method(
        au_smali,
        ".method public static final getIMSI(Landroid/content/Context;)Ljava/lang/String;",
        "    .locals 1\n    .param p0, \"ctx\"    # Landroid/content/Context;\n    const-string v0, \"\"\n    return-object v0",
    )
    au_smali = replace_smali_method(
        au_smali,
        ".method public static getWIFI(Landroid/content/Context;)Ljava/lang/String;",
        "    .locals 1\n    .param p0, \"ctx\"    # Landroid/content/Context;\n    const-string v0, \"02:00:00:00:00:00\"\n    return-object v0",
    )
    with open(android_util_path, "w", encoding="utf-8", newline="\n") as f:
        f.write(au_smali)


def build_and_sign():
    ensure_keystore()
    for tmp in (UNSIGNED_APK, ALIGNED_APK, OUTPUT_APK):
        if os.path.exists(tmp):
            os.remove(tmp)

    print("1. Building APK with Apktool...")
    subprocess.run(
        [JAVA_EXE, "-jar", APKTOOL_JAR, "b", DECOMPILED_DIR, "-o", UNSIGNED_APK],
        check=True,
    )

    print("2. Aligning APK with zipalign...")
    subprocess.run(
        [ZIPALIGN_EXE, "-p", "-f", "4", UNSIGNED_APK, ALIGNED_APK],
        check=True,
    )

    print("3. Signing APK with apksigner (v1 + v2 + v3)...")
    subprocess.run(
        [
            APKSIGNER_BAT,
            "sign",
            "--ks",
            KEYSTORE_PATH,
            "--ks-key-alias",
            "pocketheroes",
            "--ks-pass",
            "pass:android123",
            "--key-pass",
            "pass:android123",
            "--v1-signing-enabled",
            "true",
            "--v2-signing-enabled",
            "true",
            "--v3-signing-enabled",
            "true",
            "--out",
            OUTPUT_APK,
            ALIGNED_APK,
        ],
        check=True,
    )
    print(f"Done! Output APK: {OUTPUT_APK} ({os.path.getsize(OUTPUT_APK):,} bytes)")


if __name__ == "__main__":
    patch_apktool_yml()
    patch_manifest()
    patch_native_libs()
    patch_smali_files()
    build_and_sign()
