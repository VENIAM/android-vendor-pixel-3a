#! /bin/bash

set -e

vendor_download() {
    if ! [ -d "android-prepare-vendor" ]; then
        git clone \
            --depth 1 \
            --branch veniam-2020.07.00 \
            "git@github.com:zebraboemia/android-prepare-vendor.git"
    fi

    cd android-prepare-vendor

    ./execute-all.sh -d sargo -b pq3b.190801.002 -o output -y

    cd ..

    rsync -av android-prepare-vendor/output/sargo/pq3b.190801.002/vendor output
}

kernel_build() {
    mkdir -p kernel

    cd kernel

    repo init \
         -u https://android.googlesource.com/kernel/manifest \
         -b android-msm-bonito-4.9-pie-b4s4

    repo sync

    cp ../bonito_defconfig 'private/msm-google/arch/arm64/configs/bonito_defconfig'

    ./build/build.sh

    cd ..

    mkdir -p output/device/google/bonito-kernel

    rsync -av kernel/out/android-msm-bonito-4.9/dist/ output/device/google/bonito-kernel
}

mkdir -p output

kernel_build
vendor_download
