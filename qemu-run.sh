#! /bin/bash

# Fix the paths if necessary
HDA="-drive file=arch_aarch64.qcow2,format=qcow2"
KERNEL=./linux/arch/arm64/boot/Image

CMDLINE='root=/dev/vda2 rw console=ttyS0 kgdboc=ttyS1' # kgdbwait'

SHARED="./share"
VIRTFS+=" --virtfs local,path=${SHARED},mount_tag=share,security_model=passthrough,id=share "

qemu-system-aarch64 \
    -nodefaults  \
    -vga none  \
    -cpu cortex-a72  \
    -smp cpus=4,sockets=1,cores=4,threads=1  \
    -M virt,highmem=off  \
    -drive if=pflash,format=raw,unit=0,file.filename=edk2-aarch64-code.fd,file.locking=off,readonly=on  \
    -m 1024  \
     ${HDA} \
     ${VIRTFS} \
    -device virtio-rng-pci \
    -serial stdio -serial tcp::1234,server,nowait \
    -kernel "${KERNEL}" \
    ${INITRD} \
    -append "${CMDLINE} " \
    -gdb tcp::8888 \
    -nographic