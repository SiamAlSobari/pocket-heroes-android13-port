import os
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


def patch_apktool_yml():
    yml_path = os.path.join(DECOMPILED_DIR, "apktool.yml")
    with open(yml_path, "r", encoding="utf-8") as f:
        text = f.read()
    text = text.replace("targetSdkVersion: 22", "targetSdkVersion: 28")
    with open(yml_path, "w", encoding="utf-8", newline="\n") as f:
        f.write(text)


def patch_native_libs():
    armeabi_dir = os.path.join(DECOMPILED_DIR, "lib", "armeabi")
    v7a_dir = os.path.join(DECOMPILED_DIR, "lib", "armeabi-v7a")
    os.makedirs(v7a_dir, exist_ok=True)

    # Remove unused legacy libraries that contain DT_TEXTREL
    for bad_lib in ("libbspatch.so", "libgetuiext.so"):
        p = os.path.join(armeabi_dir, bad_lib)
        if os.path.exists(p):
            os.remove(p)

    # Ensure libgame.so is present in both armeabi and armeabi-v7a
    src_game = os.path.join(armeabi_dir, "libgame.so")
    dst_game = os.path.join(v7a_dir, "libgame.so")
    shutil.copy2(src_game, dst_game)


def patch_smali_files():
    # 1. Patch GameActivity.smali
    game_act_path = os.path.join(
        DECOMPILED_DIR, "smali", "com", "droidhang", "ph", "GameActivity.smali"
    )
    with open(game_act_path, "r", encoding="utf-8") as f:
        ga = f.read().replace("\r\n", "\n")

    # Remove calls to dead 2015 ad/analytics SDKs in onCreate, onPause, onResume
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


def build_and_sign():
    os.makedirs(TOOLS_DIR, exist_ok=True)
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

    if not os.path.exists(KEYSTORE_PATH):
        print("3. Generating signing keystore...")
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

    print("4. Signing APK with apksigner (v1 + v2 + v3)...")
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
    patch_native_libs()
    patch_smali_files()
    build_and_sign()
