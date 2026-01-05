# ⚡ AnyKernel3 - Pure64 Edition

### The "Syntax Error" Killer for Modern SoCs

[![Platform](https://img.shields.io/badge/Platform-Android-green.svg)](https://www.android.com)
[![Architecture](https://img.shields.io/badge/Arch-arm64--v8a-blue.svg)]()
[![License](https://img.shields.io/badge/License-GPLv3-orange.svg)]()

## 📖 About
This is a specialized fork of the legendary [AnyKernel3 by osm0sis](https://github.com/osm0sis/AnyKernel3).

**Why does this exist?**
Modern high-end SoCs (like **Dimensity 8400/9300** and **Snapdragon 8 Gen 3**) have dropped hardware support for 32-bit executables. The original AnyKernel3 includes 32-bit binaries (`busybox`, `magiskboot`) by default, which causes flashing failures on these devices with errors like:
> `/tmp/tools/magiskboot: line 1: syntax error: unexpected word (expecting ")")`

**Pure64 Edition** solves this by pre-loading **64-bit (aarch64)** static binaries, making it plug-and-play for modern GKI Kernel development.

---

## 🚀 Features

* ✅ **Native 64-bit Binaries:** All tools (`busybox`, `magiskboot`, `magiskpolicy`, `fec`, etc.) are replaced with their `aarch64` versions.
* ✅ **GKI Ready:** Optimized for Generic Kernel Image flashing (Android 14/15+).
* ✅ **GitHub Actions Friendly:** No need to download/replace tools during CI builds. Just clone and zip.
* ✅ **Clean Structure:** Removed legacy hacks not needed for modern devices.

---

## 🛠️ Usage in GitHub Actions

Since the tools are already correct, your workflow becomes incredibly simple. No `curl`, no `rm`, no hacks.

```yaml
    - name: Package AnyKernel3
      run: |
        git clone --depth=1 [https://github.com/F-Mael/AnyKernel3-Pure64.git](https://github.com/F-Mael/AnyKernel3-Pure64.git) ak3
        cd ak3
        
        # Copy your kernel image and dtbo
        cp ../kernel/out/arch/arm64/boot/Image .
        cp ../kernel/out/arch/arm64/boot/dtbo.img .
        
        # Zip it
        zip -r9 update.zip *
