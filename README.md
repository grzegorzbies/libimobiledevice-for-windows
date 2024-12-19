# Libimobiledevice for Windows
Libimobiledevice for the Windows operating system, build **2024-12-08**.

## Table of contents
* [General info](#general-info)
* [Technologies](#technologies)
* [Installation](#installation)
* [Inspiration](#inspiration)
* [Contact](#contact)

## General info
Bash shell script for building libimobiledevice for the Windows operating system, a cross-platform software library that talks the protocols to interact with iOS devices.

## Technologies
* Windows 10, 11
* MSYS2/MinGW on Windows

## Preparing the environment
1. Download, install and run **MSYS2/MinGW on Windows** from https://www.msys2.org/.
2. In the main window, enter the command:
```bash
pacman -Syu
```
3. If the window does not close automatically, enter the command:
```bash
exit
```
4. Run the program **MSYS2** (**C:\msys64\msys2.exe**).

## Installation
Automatic build and install:
1. Copy the bash script **auto-build.sh** to the **C:\msys64\home\{account name}** directory 
   (default directory or another one you entered during installation).
2. In the main window **MSYS2**, enter the command:
```bash
./auto-build.sh
```
3. Or drag and drop **auto-build.sh** into the window and press Enter.

Manual build and install:
1. Installing **pacman** packages:
```bash
    pacman -S mingw-w64-x86_64-gcc \
        base-devel \
        git \
        gcc \
        make \
        libtool \
        automake \
        autoconf \
        pkg-config \
        python-devel \
        openssl \
        openssl-devel \
        automake-wrapper \
        libcurl-devel \
        libzstd-devel 
```
2. Install **libplist**:
```bash
    cd /usr/src
    git clone https://github.com/libimobiledevice/libplist.git
    cd libplist
    ./autogen.sh --without-cython
    make
    make install
```
3. Install **libtatsu**:
```bash
    cd /usr/src
    git clone https://github.com/libimobiledevice/libtatsu.git
    cd libtatsu
    ./autogen.sh
    make
    make install
```
4. Install **libimobiledevice-glue**:
```bash
    cd /usr/src
    git clone https://github.com/libimobiledevice/libimobiledevice-glue.git
    cd libimobiledevice-glue
    ./autogen.sh
    make
    make install
```
5. Install **libusbmuxd**:
```bash
    cd /usr/src
    printf "\nDownloading and installing libusbmuxd...\n"
    git clone https://github.com/libimobiledevice/libusbmuxd.git
    cd libusbmuxd
    ./autogen.sh
    make
    make install
```
6. Build and install **libimobiledevice**:
```bash
    cd /usr/src
    git clone https://github.com/libimobiledevice/libimobiledevice.git
    cd libimobiledevice
    ./autogen.sh --without-cython --prefix=/usr/local OPENSSL_CFLAGS="-I/include/openssl" OPENSSL_LIBS="-L/bin -lssl -lcrypto"
    make
    make install
```
7. Copy libraries:
```bash
   cp /usr/bin/*.dll /usr/local/bin
```

Files are in the directory **C:\msys64\usr\local\bin**

**If you don't want to build the library yourself, the ready files are in the 'tools' directory**

## Inspiration
Project based on https://github.com/libimobiledevice/libimobiledevice

## Contact
Created by Grzegorz Bieś [g.bies@poczta.fm, grzegorzbies75@gmail.com]
