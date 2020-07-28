# Google Pixel 3a vendor files

## Downloading and building the vendor files

At least 26 GiB of RAM (or swap) are needed to build the kernel.

- Execute `./build.bash`
- Copy the contents of the folder *output* to the root of AOSP repository, overwriting any existing files

## Use prebuilt files

- Download the archive attached to the release
- Unpack its contents to the root of the root of AOSP repository, overwriting any existing files

## Build AOSP

`$ repo init -u https://android.googlesource.com/platform/manifest -b android-9.0.0_r47 --partial-clone`

`$ repo sync`

`$ . build/envsetup.sh`

`$ lunch aosp_sargo-userdebug`

`$ m -j16`

## Flash AOSP

`$ adb reboot bootloader`

The `-w` option wipes the `/data` partition on the device; this is useful for your first time flashing the device but is otherwise unnecessary.

`$ fastboot flashall -w`

### fastboot complains about the device having an incorrect bootloader version

Flash the device with the image present in this repository.

`$ fastboot flash bootloader bootloader-sargo-b4s4-0.1-5653622.img`

Retry flashing the device.

`$ adb reboot bootloader`

The `-w` option is only necessary if this is the first time flashing a specific set of images!

`$ fastboot flashall -w`

`$ fastboot reboot`

### Flashing vendor image only

Eventually, only the vendor files will change and we can skip flashing most of the other images.

`$ adb reboot bootloader`

`$ fastboot flash vendor vendor.img`

`$ fastboot reboot`
