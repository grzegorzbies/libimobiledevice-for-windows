#!/bin/sh
#
# This script build libimobiledevice for Windows.
# 
#

# install pacman packages
installPacmanPackages() {
    printf "\nPacman update and synchronized databases....\n"
    pacman -Syu

    printf "\nInstalling Pacman packages....\n"
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
}

config_file=./config.status

# install libplist
installLibplist() {
    cd /usr/src
    printf "\nDownloading and installing libplist....\n"
    git clone https://github.com/libimobiledevice/libplist.git
    cd libplist
    ./autogen.sh --without-cython
    if test -f !["$config_file"]; then 
      exit 1
    fi
    make
    make install
}

# install libtatsu
installLibtatsu() {
    cd /usr/src
    printf "\nDownloading and installing libtatsu....\n"
    git clone https://github.com/libimobiledevice/libtatsu.git
    cd libtatsu
    ./autogen.sh
    if test -f !["$config_file"]; then 
      exit 1
    fi
    make
    make install
}

# install libimobiledevice-glue
installLibimobiledeviceGlue() {
    cd /usr/src
    printf "\nDownloading and installing libimobiledevice-glue...\n"
    git clone https://github.com/libimobiledevice/libimobiledevice-glue.git
    cd libimobiledevice-glue
    ./autogen.sh
    if test -f !["$config_file"]; then 
      exit 1
    fi
    make
    make install
}

# install libusbmuxd
installLibusbmuxd() {
    cd /usr/src
    printf "\nDownloading and installing libusbmuxd...\n"
    git clone https://github.com/libimobiledevice/libusbmuxd.git
    cd libusbmuxd
    ./autogen.sh
    if test -f !["$config_file"]; then 
      exit 1
    fi
    make
    make install
}

# install libimobiledevice
installLibimobiledevice() {
    cd /usr/src
    printf "n\Downloading and installing libimobiledevice...\n"
    git clone https://github.com/libimobiledevice/libimobiledevice.git
    cd libimobiledevice
    ./autogen.sh --without-cython --prefix=/usr/local OPENSSL_CFLAGS="-I/include/openssl" OPENSSL_LIBS="-L/bin -lssl -lcrypto"
    if test -f !["$config_file"]; then 
      exit 1
    fi
    make
    make install
}

installPacmanPackages
installLibplist
installLibtatsu
installLibimobiledeviceGlue
installLibusbmuxd
installLibimobiledevice

printf "\nCoping libraries...\n"
cp /usr/bin/*.dll /usr/local/bin

printf "\nFiles are in the directory /usr/local/bin\n"

exit 0


