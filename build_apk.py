import hashlib
import os
import re
import shutil
import subprocess
import zipfile

REPO_ROOT = r"C:\Koding\rea\pocket"
ORIGINAL_APK = os.path.join(REPO_ROOT, "pocket-heroes-2-0-5.apk")
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
OUTPUT_APK = os.path.join(REPO_ROOT, "pocket-heroes-2-0-5-r3.apk")


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
    # targetSdkVersion 28 avoids Android 10+ scoped storage restrictions and Android 12+ immutable pending intent crashes
    text = re.sub(r"targetSdkVersion:\s*\d+", "targetSdkVersion: 28", text)
    with open(yml_path, "w", encoding="utf-8", newline="\n") as f:
        f.write(text)


def patch_manifest():
    manifest_path = os.path.join(DECOMPILED_DIR, "AndroidManifest.xml")
    with open(manifest_path, "r", encoding="utf-8") as f:
        xml = f.read().replace("\r\n", "\n")

    xml = re.sub(r'platformBuildVersionCode="\d+"', 'platformBuildVersionCode="28"', xml)
    xml = re.sub(r'platformBuildVersionName="[^"]+"', 'platformBuildVersionName="9"', xml)
    xml = re.sub(r'android:targetSdkVersion="\d+"', 'android:targetSdkVersion="28"', xml)

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
    os.makedirs(armeabi_dir, exist_ok=True)
    os.makedirs(v7a_dir, exist_ok=True)

    # Remove unused legacy libraries that contain DT_TEXTREL
    for bad_lib in ("libbspatch.so", "libgetuiext.so"):
        for d in (armeabi_dir, v7a_dir):
            p = os.path.join(d, bad_lib)
            if os.path.exists(p):
                os.remove(p)

    # Extract pristine original libgame.so from original APK to prevent cumulative patch corruption
    with zipfile.ZipFile(ORIGINAL_APK, "r") as z:
        clean_so = z.read("lib/armeabi/libgame.so")

    assert hashlib.sha256(clean_so).hexdigest() == "baaeb697ed64c80c02b10445882983aa330d726732100f7706e5c1851cfd91d9"
    so_data = bytearray(clean_so)

    # 1. Neutralize verify(void) at 0x0023AF74 -> bx lr (70 47) [Thumb]
    so_data[0x0023AF74:0x0023AF76] = b"\x70\x47"
    # 2. Neutralize AndroidUtil::verifySignature(void) at 0x0035BBAC -> bx lr (70 47) [Thumb]
    so_data[0x0035BBAC:0x0035BBAE] = b"\x70\x47"
    # 3. Neutralize DHHttpHelper::login(void) at 0x003614CC -> bx lr (70 47) [Thumb]
    so_data[0x003614CC:0x003614CE] = b"\x70\x47"

    # 4. Neutralize Umeng MobClickCpp crash-prone functions -> bx lr (1e ff 2f e1) [ARM]
    # MobClickCpp::startWithAppkey(char const*, char const*)
    so_data[0x005B9C00:0x005B9C04] = b"\x1e\xff\x2f\xe1"
    # MobClickCpp::updateOnlineConfig(void)
    so_data[0x005BA9C4:0x005BA9C8] = b"\x1e\xff\x2f\xe1"
    # MobClickCpp::checkUpdate(void)
    so_data[0x005BA81C:0x005BA820] = b"\x1e\xff\x2f\xe1"
    # MobClickCpp::applicationDidEnterBackground(void)
    so_data[0x005B9DBC:0x005B9DC0] = b"\x1e\xff\x2f\xe1"
    # MobClickCpp::applicationWillEnterForeground(void)
    so_data[0x005B9D70:0x005B9D74] = b"\x1e\xff\x2f\xe1"

    # 5. Food / Stamina / Life Unlimited Patches:
    # 5a. LifeMax(void) at 0x002BC4CC -> movs r0, #99; bx lr (63 20 70 47) [Thumb]
    so_data[0x002BC4CC:0x002BC4D0] = b"\x63\x20\x70\x47"
    # 5b. BalanceLifeStatus(int*, int*) at 0x002BC4E4 -> sets *pCurLife = 99, *pRemainTime = 0
    # 10 b5 00 28 01 d0 63 22 02 60 00 29 01 d0 00 22 0a 60 10 bd [Thumb]
    so_data[0x002BC4E4:0x002BC4F8] = bytes.fromhex("10b5002801d063220260002901d000220a6010bd")
    # 5c. DecreaseLife(int) at 0x002BC6DC -> movs r0, #1; bx lr (01 20 70 47) [Thumb]
    so_data[0x002BC6DC:0x002BC6E0] = b"\x01\x20\x70\x47"
    # 5d. UIStoryLayer::onLevel at 0x00310E26 -> b 0x310e2c (01 e0) to skip DecreaseLife check [Thumb]
    so_data[0x00310E26:0x00310E28] = b"\x01\xe0"
    # 5e. UIStoryLayer::onLevel at 0x00310F7A -> b 0x31102c (57 e7) to bypass popBuyLife [Thumb]
    so_data[0x00310F7A:0x00310F7C] = b"\x57\xe7"
    # 5f. UIStoryLayer::onLife at 0x003109A0 -> bx lr (70 47) to ignore tapping food icon [Thumb]
    so_data[0x003109A0:0x003109A2] = b"\x70\x47"

    # CRITICAL: Verify offset 0x006215B8 is untouched and holds "com/wwcd/util/AndroidUtil"
    assert so_data[0x006215B8:0x006215B8 + 25] == b"com/wwcd/util/AndroidUtil"

    # Write patched libgame.so to both armeabi and armeabi-v7a
    src_game = os.path.join(armeabi_dir, "libgame.so")
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
    # -------------------------------------------------------------
    # 1. Patch Cocos2dxBitmap.smali: Replace FloatMath.ceil with Math.ceil
    # -------------------------------------------------------------
    bitmap_path = os.path.join(
        DECOMPILED_DIR, "smali", "org", "cocos2dx", "lib", "Cocos2dxBitmap.smali"
    )
    with open(bitmap_path, "r", encoding="utf-8") as f:
        bm = f.read().replace("\r\n", "\n")

    ceil_float_method = """
.method private static ceilFloat(F)F
    .locals 2
    .param p0, "val"    # F

    .prologue
    float-to-double v0, p0

    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    double-to-float v0, v0

    return v0
.end method
"""
    if "ceilFloat(F)F" not in bm:
        # Insert ceilFloat right before direct methods or constructor
        bm = bm.replace(".method public constructor <init>()V", ceil_float_method + "\n.method public constructor <init>()V")

    # Replace all 3 calls to FloatMath;->ceil(F)F
    bm = re.sub(
        r"invoke-static\s*\{([^}]+)\},\s*Landroid/util/FloatMath;->ceil\(F\)F",
        r"invoke-static {\1}, Lorg/cocos2dx/lib/Cocos2dxBitmap;->ceilFloat(F)F",
        bm,
    )
    assert "Landroid/util/FloatMath;" not in bm, "FloatMath still remains in Cocos2dxBitmap.smali"

    with open(bitmap_path, "w", encoding="utf-8", newline="\n") as f:
        f.write(bm)

    # -------------------------------------------------------------
    # 2. Patch Cocos2dxRenderer.smali: Guard GL calls with sNativeInitDone
    # -------------------------------------------------------------
    renderer_path = os.path.join(
        DECOMPILED_DIR, "smali", "org", "cocos2dx", "lib", "Cocos2dxRenderer.smali"
    )
    with open(renderer_path, "r", encoding="utf-8") as f:
        ren = f.read().replace("\r\n", "\n")

    # Add static field sNativeInitDone
    if ".field public static sNativeInitDone:Z" not in ren:
        ren = ren.replace(
            ".field private static sAnimationInterval:J",
            ".field private static sAnimationInterval:J\n\n.field public static sNativeInitDone:Z = false",
        )

    # In <clinit>, initialize sNativeInitDone = false
    ren = ren.replace(
        "sput-wide v0, Lorg/cocos2dx/lib/Cocos2dxRenderer;->sAnimationInterval:J\n\n    return-void",
        "sput-wide v0, Lorg/cocos2dx/lib/Cocos2dxRenderer;->sAnimationInterval:J\n\n    const/4 v0, 0x0\n    sput-boolean v0, Lorg/cocos2dx/lib/Cocos2dxRenderer;->sNativeInitDone:Z\n\n    return-void",
    )

    # In nativeStart, set sNativeInitDone = true right after nativeInit call
    native_init_call = "invoke-static {p1, p2, v2, v3}, Lorg/cocos2dx/lib/Cocos2dxRenderer;->nativeInit(IILandroid/content/Context;Landroid/opengl/GLSurfaceView;)V"
    if "sput-boolean v4, Lorg/cocos2dx/lib/Cocos2dxRenderer;->sNativeInitDone:Z" not in ren:
        ren = ren.replace(
            native_init_call,
            native_init_call + "\n\n    const/4 v4, 0x1\n    sput-boolean v4, Lorg/cocos2dx/lib/Cocos2dxRenderer;->sNativeInitDone:Z",
        )

    # Guard onDrawFrame
    if "sget-boolean v4, Lorg/cocos2dx/lib/Cocos2dxRenderer;->sNativeInitDone:Z" not in ren:
        draw_frame_header = ".method public onDrawFrame(Ljavax/microedition/khronos/opengles/GL10;)V\n    .locals 8\n    .param p1, \"gl\"    # Ljavax/microedition/khronos/opengles/GL10;\n\n    .prologue"
        draw_frame_guard = draw_frame_header + "\n    sget-boolean v4, Lorg/cocos2dx/lib/Cocos2dxRenderer;->sNativeInitDone:Z\n    if-nez v4, :cond_native_ready\n    return-void\n    :cond_native_ready"
        ren = ren.replace(draw_frame_header, draw_frame_guard)

    # Guard handleOnPause
    ren = replace_smali_method(
        ren,
        ".method public handleOnPause()V",
        """    .locals 1

    .prologue
    sget-boolean v0, Lorg/cocos2dx/lib/Cocos2dxRenderer;->sNativeInitDone:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-static {}, Lorg/cocos2dx/lib/Cocos2dxRenderer;->nativeOnPause()V

    return-void""",
    )

    # Guard handleOnResume
    ren = replace_smali_method(
        ren,
        ".method public handleOnResume()V",
        """    .locals 1

    .prologue
    sget-boolean v0, Lorg/cocos2dx/lib/Cocos2dxRenderer;->sNativeInitDone:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-static {}, Lorg/cocos2dx/lib/Cocos2dxRenderer;->nativeOnResume()V

    return-void""",
    )

    # Guard handleKeyDown
    ren = replace_smali_method(
        ren,
        ".method public handleKeyDown(I)V",
        """    .locals 1
    .param p1, "pKeyCode"    # I

    .prologue
    sget-boolean v0, Lorg/cocos2dx/lib/Cocos2dxRenderer;->sNativeInitDone:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-static {p1}, Lorg/cocos2dx/lib/Cocos2dxRenderer;->nativeKeyDown(I)Z

    return-void""",
    )

    # Guard handleActionDown
    ren = replace_smali_method(
        ren,
        ".method public handleActionDown(IFF)V",
        """    .locals 1
    .param p1, "pID"    # I
    .param p2, "pX"    # F
    .param p3, "pY"    # F

    .prologue
    sget-boolean v0, Lorg/cocos2dx/lib/Cocos2dxRenderer;->sNativeInitDone:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-static {p1, p2, p3}, Lorg/cocos2dx/lib/Cocos2dxRenderer;->nativeTouchesBegin(IFF)V

    return-void""",
    )

    # Guard handleActionUp
    ren = replace_smali_method(
        ren,
        ".method public handleActionUp(IFF)V",
        """    .locals 1
    .param p1, "pID"    # I
    .param p2, "pX"    # F
    .param p3, "pY"    # F

    .prologue
    sget-boolean v0, Lorg/cocos2dx/lib/Cocos2dxRenderer;->sNativeInitDone:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-static {p1, p2, p3}, Lorg/cocos2dx/lib/Cocos2dxRenderer;->nativeTouchesEnd(IFF)V

    return-void""",
    )

    # Guard handleActionMove
    ren = replace_smali_method(
        ren,
        ".method public handleActionMove([I[F[F)V",
        """    .locals 1
    .param p1, "pIDs"    # [I
    .param p2, "pXs"    # [F
    .param p3, "pYs"    # [F

    .prologue
    sget-boolean v0, Lorg/cocos2dx/lib/Cocos2dxRenderer;->sNativeInitDone:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-static {p1, p2, p3}, Lorg/cocos2dx/lib/Cocos2dxRenderer;->nativeTouchesMove([I[F[F)V

    return-void""",
    )

    # Guard handleActionCancel
    ren = replace_smali_method(
        ren,
        ".method public handleActionCancel([I[F[F)V",
        """    .locals 1
    .param p1, "pIDs"    # [I
    .param p2, "pXs"    # [F
    .param p3, "pYs"    # [F

    .prologue
    sget-boolean v0, Lorg/cocos2dx/lib/Cocos2dxRenderer;->sNativeInitDone:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-static {p1, p2, p3}, Lorg/cocos2dx/lib/Cocos2dxRenderer;->nativeTouchesCancel([I[F[F)V

    return-void""",
    )

    with open(renderer_path, "w", encoding="utf-8", newline="\n") as f:
        f.write(ren)

    # -------------------------------------------------------------
    # 3. Patch BEUtil.smali and BEUtil$10.smali
    # -------------------------------------------------------------
    be_util_path = os.path.join(
        DECOMPILED_DIR, "smali", "com", "hz", "game", "be", "util", "BEUtil.smali"
    )
    with open(be_util_path, "r", encoding="utf-8") as f:
        be_smali = f.read().replace("\r\n", "\n")

    be_smali = be_smali.replace("com.hz.game.be", "com.droidhang.ph")
    be_smali = replace_smali_method(
        be_smali,
        ".method public static onRated()V",
        "    .locals 0\n    return-void",
    )
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
    be_smali = replace_smali_method(
        be_smali,
        ".method public static onWindowFocusChanged(ILandroid/opengl/GLSurfaceView;)V",
        """    .locals 2
    .param p0, "value"    # I
    .param p1, "glSurfaceView"    # Landroid/opengl/GLSurfaceView;

    .prologue
    sget-boolean v0, Lorg/cocos2dx/lib/Cocos2dxRenderer;->sNativeInitDone:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    sget-object v0, Lcom/hz/game/be/util/BEUtil;->_glSurfaceView:Landroid/opengl/GLSurfaceView;

    if-nez v0, :cond_1

    sput-object p1, Lcom/hz/game/be/util/BEUtil;->_glSurfaceView:Landroid/opengl/GLSurfaceView;

    :cond_1
    sget-object v0, Lcom/hz/game/be/util/BEUtil;->_glSurfaceView:Landroid/opengl/GLSurfaceView;

    if-eqz v0, :cond_2

    new-instance v1, Lcom/hz/game/be/util/BEUtil$10;

    invoke-direct {v1, p0}, Lcom/hz/game/be/util/BEUtil$10;-><init>(I)V

    invoke-virtual {v0, v1}, Landroid/opengl/GLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    :cond_2
    return-void""",
    )
    with open(be_util_path, "w", encoding="utf-8", newline="\n") as f:
        f.write(be_smali)

    be10_path = os.path.join(
        DECOMPILED_DIR, "smali", "com", "hz", "game", "be", "util", "BEUtil$10.smali"
    )
    with open(be10_path, "r", encoding="utf-8") as f:
        be10 = f.read().replace("\r\n", "\n")

    be10 = replace_smali_method(
        be10,
        ".method public run()V",
        """    .locals 1

    .prologue
    sget-boolean v0, Lorg/cocos2dx/lib/Cocos2dxRenderer;->sNativeInitDone:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget v0, p0, Lcom/hz/game/be/util/BEUtil$10;->val$value:I

    invoke-static {v0}, Lcom/hz/game/be/util/BEUtil;->nOnWindowFocusChanged(I)V

    return-void""",
    )
    with open(be10_path, "w", encoding="utf-8", newline="\n") as f:
        f.write(be10)

    # -------------------------------------------------------------
    # 4. Patch DHGooglePaymentManager.smali
    # -------------------------------------------------------------
    pay_path = os.path.join(
        DECOMPILED_DIR, "smali", "com", "droidhang", "pay", "DHGooglePaymentManager.smali"
    )
    with open(pay_path, "r", encoding="utf-8") as f:
        pay = f.read().replace("\r\n", "\n")

    pay = pay.replace(
        "invoke-direct {p0}, Lcom/droidhang/pay/DHGooglePaymentManager;->initPurchase()V",
        "const/4 v0, 0x0\n    iput-boolean v0, p0, Lcom/droidhang/pay/DHGooglePaymentManager;->supportPurchase:Z",
    )
    # Remove mHelper.logError in buyItemInMainThread
    bad_log_error = """    :cond_0
    iget-object v0, p0, Lcom/droidhang/pay/DHGooglePaymentManager;->mHelper:Lcom/droidhang/pay/util/IabHelper;

    const-string v1, "supportPurchase false"

    invoke-virtual {v0, v1}, Lcom/droidhang/pay/util/IabHelper;->logError(Ljava/lang/String;)V

    .line 263
    invoke-virtual {p0}, Lcom/droidhang/pay/DHGooglePaymentManager;->alertBillingNotSupport()V"""

    good_log_error = """    :cond_0
    invoke-virtual {p0}, Lcom/droidhang/pay/DHGooglePaymentManager;->alertBillingNotSupport()V"""
    pay = pay.replace(bad_log_error, good_log_error)

    # Guard handleActivityResult
    pay = replace_smali_method(
        pay,
        ".method public handleActivityResult(IILandroid/content/Intent;)Z",
        """    .locals 1
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    iget-object v0, p0, Lcom/droidhang/pay/DHGooglePaymentManager;->mHelper:Lcom/droidhang/pay/util/IabHelper;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    invoke-virtual {v0, p1, p2, p3}, Lcom/droidhang/pay/util/IabHelper;->handleActivityResult(IILandroid/content/Intent;)Z

    move-result v0

    return v0""",
    )
    with open(pay_path, "w", encoding="utf-8", newline="\n") as f:
        f.write(pay)

    # -------------------------------------------------------------
    # 5. Patch IOUtil.smali
    # -------------------------------------------------------------
    io_util_path = os.path.join(
        DECOMPILED_DIR, "smali", "com", "wwcd", "util", "IOUtil.smali"
    )
    with open(io_util_path, "r", encoding="utf-8") as f:
        io_smali = f.read().replace("\r\n", "\n")

    bad_io_delete = """    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v1

    .line 167
    .local v1, "files":[Ljava/io/File;
    array-length v3, v1"""

    good_io_delete = """    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v1

    if-nez v1, :cond_io_not_null

    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    return-void

    :cond_io_not_null
    .line 167
    .local v1, "files":[Ljava/io/File;
    array-length v3, v1"""
    io_smali = io_smali.replace(bad_io_delete, good_io_delete)

    with open(io_util_path, "w", encoding="utf-8", newline="\n") as f:
        f.write(io_smali)

    # -------------------------------------------------------------
    # 6. Patch GameActivity.smali
    # -------------------------------------------------------------
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

    # -------------------------------------------------------------
    # 7. Patch GameHelper.smali
    # -------------------------------------------------------------
    helper_path = os.path.join(
        DECOMPILED_DIR, "smali", "com", "google", "example", "games", "basegameutils", "GameHelper.smali"
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

    # -------------------------------------------------------------
    # 8. Patch VideoAdManager.smali
    # -------------------------------------------------------------
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

    # -------------------------------------------------------------
    # 9. Patch AndroidUtil.smali
    # -------------------------------------------------------------
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
