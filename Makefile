.PHONY: all clean

obj-m := uhid.o
KBUILD_DIR := /lib/modules/$(shell uname -r)/build

all: uhid.ko

clean:
	rm -f .uhid.* Module.symvers modules.order *.ko *.mod *.mod.*c *.o

uhid.ko: uhid.c
	$(MAKE) -C $(KBUILD_DIR) M=$(PWD) KBUILD_VERBOSE=0 CONFIG_DEBUG_INFO=y modules
