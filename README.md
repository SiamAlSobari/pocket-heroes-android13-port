# Pocket Heroes (v2.0.5) - Android 13/14+ Compatibility Port

[![Latest Release](https://img.shields.io/github/v/release/SiamAlSobari/pocket-heroes-android13-port?color=brightgreen&label=Release)](https://github.com/SiamAlSobari/pocket-heroes-android13-port/releases/latest)
[![Target SDK](https://img.shields.io/badge/targetSdkVersion-28-blue.svg)](https://developer.android.com)
[![Platform](https://img.shields.io/badge/Platform-Android%2011%20%7C%2012%20%7C%2013%20%7C%2014%20%7C%2015-orange.svg)](https://android.com)
[![Architecture](https://img.shields.io/badge/ABI-armeabi--v7a-lightgrey.svg)](https://developer.android.com/ndk/guides/abis)

A compatibility port and startup crash fix for the classic 2014 action RPG **Pocket Heroes v2.0.5** (`com.droidhang.ph`), re-engineered to install and run smoothly on modern Android devices running **Android 11, 12, 13, 14, and 15**.

---

## 📥 Download Latest APK

* **Latest Release**: [Pocket Heroes v2.0.5 Release 3 (v2.0.5-r3)](https://github.com/SiamAlSobari/pocket-heroes-android13-port/releases/tag/v2.0.5-r3)
* **Direct APK Download**: [pocket-heroes-2-0-5-r3.apk](https://github.com/SiamAlSobari/pocket-heroes-android13-port/releases/download/v2.0.5-r3/pocket-heroes-2-0-5-r3.apk)

---

## ⚠️ Important Note for Android 14 & 15 Users

When launching the game for the first time on Android 14 or 15, the OS will display a system notification dialog:

> **"This app is not compatible with the latest version of Android. Check for updates, or contact the app's developer."**

**This is expected behavior and not an error.** This dialog is Android's built-in `DeprecatedAbiDialog` informing you that the application runs a 32-bit native binary (`armeabi-v7a`) on a 64-bit CPU architecture.

👉 **Simply tap "OK"**, and the game will proceed to the main title screen and run smoothly without any crashes.

---

## 🛠️ Technical Fixes Breakdown

The original 2014 release suffered from multiple fatal crashes on modern Android runtimes. This repository applies an automated pipeline of Smali and native binary patches to resolve each root cause:

### 1. Eliminated `FloatMath.ceil` Crash (`NoSuchMethodError`)
* Google completely removed `android.util.FloatMath` methods starting in Android 6.0 (API 23).
* Cocos2d-x's `Cocos2dxBitmap` relied on `FloatMath.ceil(F)F` for text and font measurement calculations, which instantly threw an unhandled `NoSuchMethodError` on modern ART runtimes upon game startup.
* **Fix**: Implemented a helper bridge method in Smali that routes calls to `java.lang.Math.ceil(D)D`, which is universally supported across all Java and Android runtime versions.

### 2. Guarded GL SurfaceView Lifecycle (`sNativeInitDone`)
* When the Android 14/15 system compatibility dialog pops up, the activity loses window focus and immediately triggers `onPause()`.
* In the stock 2014 engine, this sent an event to the native C++ engine before the GL thread had completed `nativeInit()`, causing null-pointer dereferences (`SIGSEGV / SEGV_MAPERR`) inside `CCDirector`.
* **Fix**: Introduced a static `sNativeInitDone` state guard in `Cocos2dxRenderer.smali` and `BEUtil.smali`. Render passes, touch inputs, and pause/resume calls are safely ignored until native C++ initialization has completely finished.

### 3. Preserved JNI String & Applied Machine Opcode Signature Bypass
* Earlier reverse-engineering attempts overwrote memory bytes at offset `0x006215B8` with keystore MD5 hashes under the assumption that it was a certificate hash location. In reality, offset `0x006215B8` stores the ASCII class descriptor string `"com/wwcd/util/AndroidUtil"`. Overwriting it caused JNI `FindClass` to fail immediately on startup.
* **Fix**: Preserved the original pristine `libgame.so` and bypassed signature and license verification at the ARM/Thumb assembly level using `bx lr` opcodes (`70 47` for Thumb functions `verify` and `verifySignature`; `1e ff 2f e1` for ARM routines).

### 4. Target SDK Optimization (`targetSdkVersion: 28`)
* Configured `targetSdkVersion: 28` (Android 9 Pie) to satisfy Android 14+'s minimum install threshold (`targetSdk >= 24`).
* Bypasses strict Android 10+ Scoped Storage restrictions and Android 12+ (API 31+) mandatory `FLAG_IMMUTABLE` PendingIntent crashes in legacy 2014 third-party libraries.

### 5. Neutralized Defunct SDKs & Analytics
* Neutralized native calls to Umeng Analytics (`MobClickCpp`) that attempted background network synchronization with discontinued telemetry endpoints.
* Stubbed abandoned ad networks (Tapjoy, SponsorPay, InMobi, CrossPromotion) to prevent `NullPointerException`s.
* Added null-safety guards in `DHGooglePaymentManager` and `IOUtil.delete()` to safely handle missing local directories and disabled billing services.

### 6. Free & Unlimited Food/Stamina System (0 Cost Matches)
* The original 2014 game enforced an energy timer ("Food/Life"), costing 1 food per stage entry and gating players behind wait timers or defunct microtransactions.
* **Fix**:
  * Neutralized `DecreaseLife(int)` in `libgame.so` to always return `true` without decrementing food.
  * Patched `UIStoryLayer::onLevel` to bypass stamina depletion checks and eliminate the "Buy Food" pop-up.
  * Configured `BalanceLifeStatus` and `LifeMax` to maintain a permanent 99/99 food pool with 0 recovery timer. Players can now enjoy non-stop dungeon runs without waiting.

---

## 🧪 Automated Compatibility Testing

This repository includes a 9-point automated test suite (`pytest`) to verify build integrity:

```bash
pytest tests/test_apk_compatibility.py
```

The test suite validates:
1. Absence of illegal `DT_TEXTREL` flags in ELF dynamic headers.
2. Exact byte opcode replacements at all native patch offsets in `libgame.so`.
3. Complete eradication of `Landroid/util/FloatMath;` from all Smali classes.
4. Correct installation of the `sNativeInitDone` lifecycle guard.
5. APK alignment and v1/v2/v3 signature validity via `apksigner`.

---

## 🔨 Building from Source

### Prerequisites:
* **Java Development Kit (JDK 17+)**
* **Python 3.10+**
* **Android SDK Build-Tools** (`zipalign` and `apksigner`)
* **Apktool** (placed in `tools/apktool.jar`)

### Build Steps:
1. Clone this repository:
   ```bash
   git clone https://github.com/SiamAlSobari/pocket-heroes-android13-port.git
   cd pocket-heroes-android13-port
   ```
2. Run the automated patch and build script:
   ```bash
   python build_apk.py
   ```
3. The aligned, patched, and signed APK will be output to:
   ```
   pocket-heroes-2-0-5-r2.apk
   ```

---

## 📂 Repository Structure

```
├── pocket-heroes-decompiled/    # Decompiled Smali bytecode, assets, and AndroidManifest.xml
│   ├── AndroidManifest.xml     # Patched application manifest
│   ├── apktool.yml             # Apktool SDK configuration
│   ├── lib/                    # Native shared libraries (armeabi, armeabi-v7a)
│   └── smali/                  # Patched Dalvik bytecode
├── tests/
│   └── test_apk_compatibility.py # Automated pytest compatibility verification suite
├── tools/                      # Build keystore and utilities
├── build_apk.py                # Automated decompilation patch and packaging pipeline
└── README.md
```

---

## ⚖️ Disclaimer

This repository is maintained strictly for **digital preservation, hardware compatibility research, and educational reverse engineering purposes**. All game assets, characters, artwork, audio, and trademarks remain the sole intellectual property of the original developer (**Droidhang**).
