# Pocket Heroes (v2.0.5) - Android 13/14+ Port

[![Latest Release](https://img.shields.io/github/v/release/SiamAlSobari/pocket-heroes-android13-port?color=brightgreen&label=Release)](https://github.com/SiamAlSobari/pocket-heroes-android13-port/releases/latest)
[![Target SDK](https://img.shields.io/badge/targetSdkVersion-28-blue.svg)](https://developer.android.com)
[![Platform](https://img.shields.io/badge/Platform-Android%2011%20to%2015-orange.svg)](https://android.com)
[![Architecture](https://img.shields.io/badge/ABI-armeabi--v7a-lightgrey.svg)](https://developer.android.com/ndk/guides/abis)

A compatibility port and startup crash fix for Pocket Heroes v2.0.5 (`com.droidhang.ph`, released in 2014). This version installs and runs on Android 11 through 15 without force-closing.

---

## Downloads

- Latest release: [Pocket Heroes v2.0.5 Release 3 (v2.0.5-r3)](https://github.com/SiamAlSobari/pocket-heroes-android13-port/releases/tag/v2.0.5-r3)
- Direct APK: [pocket-heroes-2-0-5-r3.apk](https://github.com/SiamAlSobari/pocket-heroes-android13-port/releases/download/v2.0.5-r3/pocket-heroes-2-0-5-r3.apk)

---

## Android 14 and 15 Dialog

When launching the game on Android 14 or 15, the system shows this dialog:

> "This app is not compatible with the latest version of Android. Check for updates, or contact the app's developer."

This is Android's standard `DeprecatedAbiDialog`. It appears whenever a 32-bit binary (`armeabi-v7a`) runs on a 64-bit device. Tap "OK" to dismiss it; the game will continue to the title screen and run normally.

---

## Fixes Applied

The original 2014 APK crashes on modern Android devices due to removed APIs, missing runtime flags, and unhandled lifecycle events. The following changes fix those issues:

### FloatMath.ceil removal
Google removed `android.util.FloatMath` in Android 6.0 (API 23). The Cocos2d-x engine in `Cocos2dxBitmap` called `FloatMath.ceil(F)F` during text rendering, throwing a fatal `NoSuchMethodError` on launch. Calls now route through a helper method to `java.lang.Math.ceil(D)D`.

### OpenGL surface lifecycle guard
When Android 14 or 15 shows the compatibility dialog, the activity loses window focus and calls `onPause()`. In the original engine, this dispatched pause events to C++ before the OpenGL thread finished `nativeInit()`, causing a null pointer dereference (`SIGSEGV`) in `CCDirector`. A static `sNativeInitDone` flag in `Cocos2dxRenderer.smali` and `BEUtil.smali` now guards render, touch, pause, and resume events until native initialization completes.

### JNI class name preservation and signature bypass
Previous patches overwrote offset `0x006215B8` in `libgame.so` with a keystore MD5 string. That offset actually stores the class name `"com/wwcd/util/AndroidUtil"`, which broke JNI `FindClass` on startup. The clean binary is now extracted directly from the baseline APK, and signature verification is bypassed with `bx lr` opcodes in `verify` and `verifySignature` (`0x70 0x47`).

### Target SDK set to 28
Setting `targetSdkVersion` to 28 (Android 9) allows installation on Android 14 and 15 (which block targetSdk below 24). It also avoids Android 10+ Scoped Storage restrictions and Android 12+ requirements for `FLAG_IMMUTABLE` on `PendingIntent`, which the 2014 libraries do not set.

### Inactive SDKs and telemetry neutralized
- Patched Umeng analytics functions (`MobClickCpp`) with `bx lr` (`0x1e 0xff 0x2f 0xe1`) in `libgame.so`.
- Removed dead ad network initializations (Tapjoy, SponsorPay, InMobi, CrossPromotion) from `GameActivity.smali`.
- Added null checks in `DHGooglePaymentManager.smali` and `IOUtil.smali` to avoid crashes from missing directories and offline billing helpers.

### Unlimited food and stamina
The original game required 1 food point per stage, with a timer to regenerate points.
- Patched `DecreaseLife(int)` in `libgame.so` to return `true` without deducting food.
- Patched `UIStoryLayer::onLevel` to bypass food checks and skip the "Buy Food" popup.
- Set `BalanceLifeStatus` and `LifeMax` to return 99/99 food and 0 remaining timer seconds.

---

## Automated Tests

Run the test suite with pytest:

```bash
pytest tests/test_apk_compatibility.py
```

The tests verify:
- No `DT_TEXTREL` in native dynamic libraries.
- Exact patch bytes in `libgame.so` for signature bypass, telemetry, and stamina routines.
- Complete absence of `Landroid/util/FloatMath;` in decompiled Smali.
- Presence of lifecycle guards in `Cocos2dxRenderer.smali`.
- Valid v1, v2, and v3 APK signatures via `apksigner`.

---

## Building from Source

### Prerequisites
- JDK 17 or higher
- Python 3.10 or higher
- Android SDK build-tools (`zipalign` and `apksigner`)
- Apktool (`tools/apktool.jar`)

### Build Steps
1. Clone the repository:
   ```bash
   git clone https://github.com/SiamAlSobari/pocket-heroes-android13-port.git
   cd pocket-heroes-android13-port
   ```
2. Run the build script:
   ```bash
   python build_apk.py
   ```
3. The signed APK is written to `pocket-heroes-2-0-5-r3.apk`.

---

## Repository Layout

```
├── pocket-heroes-decompiled/    # Decompiled Smali, assets, and AndroidManifest.xml
│   ├── AndroidManifest.xml     # Patched manifest (targetSdk 28, exported components)
│   ├── apktool.yml             # Apktool configuration
│   ├── lib/                    # Native libraries (armeabi, armeabi-v7a)
│   └── smali/                  # Patched Smali bytecode
├── tests/
│   └── test_apk_compatibility.py # Automated compatibility tests
├── tools/                      # Keystore and build utilities
├── build_apk.py                # Build and patch script
└── README.md
```

---

## Disclaimer

This repository is maintained for preservation and compatibility research. Game assets, artwork, audio, and code remain the property of the original developer, Droidhang.
