Download/build vendor files for Google Pixel 3a.

At least 26 GiB of RAM (or swap) are needed to build the kernel.

1) Execute `./build.bash`
2) Copy contents of the *output* directory to the root of AOSP repository, overwriting any existing files

`$ repo init -u https://android.googlesource.com/platform/manifest -b android-9.0.0_r47 --partial-clone`

`$ repo sync`

`$ . build/envsetup.sh`

`$ lunch aosp_sargo-userdebug`

`$ m -j16`

