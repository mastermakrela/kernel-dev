# use this if you want to build for current os
# KERNELDIR_LKP ?= /lib/modules/$(shell uname -r)/build

KERNELDIR_LKP ?= $(KERN_SRC)

obj-m += hello_world.o

all:
	make -C $(KERNELDIR_LKP) M=$$PWD modules

clean:
	make -C $(KERNELDIR_LKP) M=$$PWD clean
