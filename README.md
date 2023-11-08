# Kernel Programming Template for VS Code

To develop linux kernel and/or modules clone this repository, open it in VS Code
and follow the setup steps.

If you plan to work on **apple silicon mac** (like I do),
it's worth to check out my full [setup guide](https://mastermakrela.com/kernel),
because not everything works natively on a mac.

## Setup

0. Clone this repository
   `git clone https://github.com/mastermakrela/kernel-dev.git`

1. Open the repository in VS Code
   `code kernel-dev`

2. Install the recommended extensions

   1. [C/C++](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools) from Microsoft

      Corresponding config file: [`c_cpp_properties.json`](.vscode/c_cpp_properties.json)

   2. [Clang-Format](https://marketplace.visualstudio.com/items?itemName=xaver.clang-format)

      Corresponding config file: [`.clang-format`](.clang-format)
      It's a symlink to file that will exist after you get the kernel source.

   3. [Makefile Tools](https://marketplace.visualstudio.com/items?itemName=ms-vscode.makefile-tools)

3. Clone the kernel source

   1. `git clone https://github.com/torvalds/linux.git --depth=1`

      `--depth=1` is optional, but recommended to save time and space

4. Get some image for qemu

   - you can for example extract the `.qcow` from [here](https://mac.getutm.app/gallery/archlinux-arm)
   - just name it `arch_aarch64.qcow2` or update the name in [qemu-run.sh](qemu-run.sh)

## Development

First you need a kernel:

1. `cd linux`
2. `make defconfig`
3. `make -j$(nproc)`

If you're on ARM you're good to go, on x86 you need to update the path in [qemu-run.sh](qemu-run.sh)

Now you can open the [module](modules/hello_world/hello_world.c) and start developing.
You can build the module with `make`
and copy it to the VM with `cp *.ko ../../share`.

Test that it works with `insmod hello_world.ko` and `rmmod hello_world.ko` (inside the VM).
