#! /bin/bash

# Fix the paths if necessary
HDA="-drive file=arch_aarch64.qcow2,format=qcow2"
KERNEL=./linux/arch/arm64/boot/Image

CMDLINE='root=/dev/vda2 rw console=ttyAMA0 kgdboc=ttyS0' # kgdbwait'

SHARED="./share"
VIRTFS+=" --virtfs local,path=${SHARED},mount_tag=share,security_model=passthrough,id=share "

qemu-system-aarch64 \
    -nodefaults  \
    -nographic \
    -vga none  \
    -cpu max  \
    -machine virt  \
    -m 1024  \
     ${HDA} \
     ${VIRTFS} \
    -chardev stdio,mux=on,id=char0 \
    -chardev socket,path=/tmp/qemu_socket.sock,server=on,wait=off,id=gnc0 \
    -mon chardev=char0,mode=readline \
    -serial chardev:char0 \
    -device pci-serial,id=serial0,chardev=gnc0 \
    -kernel "${KERNEL}" \
    -append "${CMDLINE} "