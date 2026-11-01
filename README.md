# Pocket Heroes (v2.0.5) - Android 13/14+ Compatibility Port

[![Latest Release](https://img.shields.io/github/v/release/SiamAlSobari/pocket-heroes-android13-port?color=brightgreen&label=Release)](https://github.com/SiamAlSobari/pocket-heroes-android13-port/releases/latest)
[![Target SDK](https://img.shields.io/badge/targetSdkVersion-28-blue.svg)](https://developer.android.com)
[![Platform](https://img.shields.io/badge/Platform-Android%2011%20%7C%2012%20%7C%2013%20%7C%2014%20%7C%2015-orange.svg)](https://android.com)
[![Architecture](https://img.shields.io/badge/ABI-armeabi--v7a-lightgrey.svg)](https://developer.android.com/ndk/guides/abis)

Port kompatibilitas dan perbaikan startup crash untuk game klasik **Pocket Heroes v2.0.5** (`com.droidhang.ph`, rilis tahun 2014) agar dapat dipasang dan dimainkan dengan lancar di perangkat modern yang menjalankan **Android 11, 12, 13, 14, dan 15**.

---

## 📥 Download APK Terbaru

* **Versi Rilis**: [Pocket Heroes v2.0.5 Release 2 (v2.0.5-r2)](https://github.com/SiamAlSobari/pocket-heroes-android13-port/releases/tag/v2.0.5-r2)
* **File Langsung**: [pocket-heroes-2-0-5-r2.apk](https://github.com/SiamAlSobari/pocket-heroes-android13-port/releases/download/v2.0.5-r2/pocket-heroes-2-0-5-r2.apk)

---

## ⚠️ Catatan Pengguna Android 14 & 15

Saat pertama kali membuka game di Android 14 atau 15, sistem operasi Android akan memunculkan pop-up pemberitahuan:

> **"Aplikasi ini tidak kompatibel dengan versi terbaru Android. Periksa update atau hubungi developer aplikasi."**

**Hal ini wajar dan bukan error.** Pop-up tersebut adalah dialog bawaan sistem Android (`DeprecatedAbiDialog`) karena binary game berarsitektur 32-bit (`armeabi-v7a`).

👉 **Cukup tekan tombol "Oke"**, dan game akan langsung masuk ke menu utama serta berjalan normal tanpa force-close.

---

## 🛠️ Ringkasan Perbaikan Teknis

Game asli tahun 2014 mengalami beberapa masalah fatal ketika dijalankan di Android versi baru. Repositori ini menerapkan serangkaian patch otomatis:

### 1. Eliminasi Crash `FloatMath.ceil` (`NoSuchMethodError`)
* Google telah menghapus class `android.util.FloatMath` secara permanen sejak Android 6.0 (API 23).
* Pada file smali engine `Cocos2dxBitmap`, panggilan font measuring menggunakan `FloatMath.ceil(F)F` yang langsung memicu fatal exception saat game memuat teks font.
* **Perbaikan**: Dialihkan ke method bridge `java.lang.Math.ceil(D)D` yang didukung penuh di semua runtime Android.

### 2. Guard OpenGL SurfaceView Lifecycle (`sNativeInitDone`)
* Ketika dialog sistem Android 14/15 muncul, activity game kehilangan fokus dan langsung memicu event `onPause()`.
* Pada engine bawaan, event ini memanggil fungsi native C++ sebelum thread render selesai menjalankan `nativeInit()`, yang menyebabkan crash pointer dereference (`SIGSEGV`).
* **Perbaikan**: Ditambahkan guard statis `sNativeInitDone` di `Cocos2dxRenderer.smali` dan `BEUtil.smali` untuk menahan event render, input touch, dan lifecycle pause/resume sampai inisialisasi native benar-benar tuntas.

### 3. Preservasi JNI String & Bypass Signature Assembly
* Patch lawas sering kali merusak byte di offset `0x006215B8` pada `libgame.so` karena mengiranya sebagai MD5 sertifikat, padahal string tersebut adalah `com/wwcd/util/AndroidUtil`. Hal ini menyebabkan JNI `FindClass` gagal total saat startup.
* **Perbaikan**: Menggunakan binary murni yang diekstrak langsung dari APK asli, lalu melakukan bypass verifikasi lisensi dan signature pada level instruksi mesin opcode Thumb `bx lr` (`70 47`) di fungsi `verify` dan `verifySignature`.

### 4. Target SDK Optimal (`targetSdkVersion: 28`)
* Menggunakan API 28 (Android 9 Pie) untuk melompati batas blokir instalasi minimum Android 14 (`minInstall >= 24`).
* Menghindari crash `FLAG_IMMUTABLE` pada `PendingIntent` (wajib di API 31+) serta pembatasan Scoped Storage ketat (API 30+) yang tidak didukung oleh library bawaan tahun 2014.

### 5. Netralisasi SDK & Analytics Lawas
* Menonaktifkan pemanggilan native C++ Umeng Analytics (`MobClickCpp`) yang mencoba mengirim sinyal telemetri ke server offline.
* Menonaktifkan SDK iklan mati (Tapjoy, SponsorPay, InMobi, CrossPromotion) agar tidak memicu `NullPointerException`.
* Mengamankan Google Play In-App Billing (`DHGooglePaymentManager`) agar menampilkan dialog informatif saat toko dibuka, bukan crash.

---

## 🧪 Pengujian Kompatibilitas Otomatis

Proyek ini dilengkapi dengan rangkaian pengujian otomatis (`pytest`) untuk menjamin integritas APK:

```bash
pytest tests/test_apk_compatibility.py
```

Rangkaian tes mencakup:
1. Validasi struktur ELF native library terhadap flag terlarang `DT_TEXTREL`.
2. Verifikasi byte opcode assembly pada titik patch `libgame.so`.
3. Verifikasi ketiadaan class `Landroid/util/FloatMath;` di seluruh file smali.
4. Pengecekan guard lifecycle di `Cocos2dxRenderer`.
5. Validasi signature APK skema v1, v2, dan v3 menggunakan `apksigner`.

---

## 🔨 Cara Build dari Source Code

### Prasyarat:
* **Java Development Kit (JDK 17+)**
* **Python 3.10+**
* **Android SDK Build-Tools** (`zipalign` dan `apksigner`)
* **Apktool** (disimpan di folder `tools/apktool.jar`)

### Langkah Build:
1. Clone repositori ini:
   ```bash
   git clone https://github.com/SiamAlSobari/pocket-heroes-android13-port.git
   cd pocket-heroes-android13-port
   ```
2. Jalankan skrip build otomatis:
   ```bash
   python build_apk.py
   ```
3. File APK yang sudah ter-patch, ter-align, dan ter-sign akan dibuat di:
   ```
   pocket-heroes-2-0-5-r2.apk
   ```

---

## 📂 Struktur Repositori

```
├── pocket-heroes-decompiled/    # Kode sumber hasil dekompilasi (smali, assets, xml)
│   ├── AndroidManifest.xml     # Manifest yang telah disesuaikan
│   ├── apktool.yml             # Konfigurasi target SDK
│   ├── lib/                    # Native binaries (armeabi, armeabi-v7a)
│   └── smali/                  # Bytecode Dalvik hasil patch
├── tests/
│   └── test_apk_compatibility.py # Automated compatibility test suite
├── tools/                      # Keystore dan tools pendukung build
├── build_apk.py                # Skrip otomatis patching, compiling, dan signing
└── README.md
```

---

## ⚖️ Penafian (Disclaimer)

Proyek ini dibuat murni untuk tujuan **preservasi (arsip), kompatibilitas perangkat keras modern, edukasi, dan penelitian reverse engineering**. Seluruh aset game, grafis, suara, logika permainan, dan merek dagang adalah hak cipta milik pengembang aslinya (**Droidhang**).
