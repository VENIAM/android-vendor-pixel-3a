# Downloading and building vendor files for Google Pixel 3a.

At least 26 GiB of RAM (or swap) are needed to build the kernel.

- Execute `./build.bash`
- Copy the contents of the folder *output* to the root of AOSP repository, overwriting any existing files

# Use prebuilt files

- Download the archive attached to the release
- Unpack its contents to the root of the root of AOSP repository, overwriting any existing files

# Build AOSP for the Google Pixel 3a

`$ repo init -u https://android.googlesource.com/platform/manifest -b android-9.0.0_r47 --partial-clone`

`$ repo sync`

`$ . build/envsetup.sh`

`$ lunch aosp_sargo-userdebug`

`$ m -j16`

