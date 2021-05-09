.PHONY: all clean

obj-m := uhid.o
KBUILD_DIR := /lib/modules/$(shell uname -r)/build
ifeq "$(wildcard $(KBUILD_DIR))" ""
  # overwrite for Chrome OS
  KBUILD_DIR := /lib/modules/$(lastword $(shell ls /lib/modules | awk '{print length(), $$0}' | sort -nr | awk '{print $$2}'))/build
endif

all: uhid.ko

clean:
	rm -f .uhid.* Module.symvers modules.order *.ko *.mod *.mod.*c *.o

uhid.ko: uhid.c
	$(MAKE) -C $(KBUILD_DIR) M=$(PWD) KBUILD_VERBOSE=0 CONFIG_DEBUG_INFO=y modules
