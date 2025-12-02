DTS_DIR := $(DTS_DIR)/siflower

define Device/Default
  PROFILES = Default $$(DEVICE_NAME)
  BLOCKSIZE := 64k
  KERNEL = kernel-bin | lzma
  KERNEL_INITRAMFS = kernel-bin | lzma | \
	fit lzma $$(KDIR)/image-$$(firstword $$(DEVICE_DTS)).dtb with-initrd | pad-to 128k
  KERNEL_LOADADDR := 0x20000000
  FILESYSTEMS := squashfs
  DEVICE_DTS_DIR := $(DTS_DIR)
  IMAGES := sysupgrade.bin
  IMAGE/sysupgrade.bin = append-kernel | fit lzma $$(KDIR)/image-$$(firstword $$(DEVICE_DTS)).dtb external-static-with-rootfs | pad-rootfs | append-metadata
endef

define Device/siflower-one-nand
    DEVICE_VENDOR := Siflower
    DEVICE_MODEL := One (Booting from NAND)
    DEVICE_DTS := sf21h8898-siflower-one-nand
    SUPPORTED_DEVICES := siflower,one-nand
endef
TARGET_DEVICES += siflower-one-nand

define Device/siflower-one-nor
    DEVICE_VENDOR := Siflower
    DEVICE_MODEL := One (Booting from NOR)
    DEVICE_DTS := sf21h8898-siflower-one-nor
    SUPPORTED_DEVICES := siflower,one-nor
endef
TARGET_DEVICES += siflower-one-nor

define Device/bpi-rv2-nand
    DEVICE_VENDOR := BananaPi
    DEVICE_MODEL := BPI-RV2 (Booting from NAND)
    DEVICE_DTS := sf21h8898-bpi-rv2-nand
    SUPPORTED_DEVICES := bananapi,bpi-rv2-nand
endef
TARGET_DEVICES += bpi-rv2-nand

define Device/bpi-rv2-nor
    DEVICE_VENDOR := BananaPi
    DEVICE_MODEL := BPI-RV2 (Booting from NOR)
    DEVICE_DTS := sf21h8898-bpi-rv2-nor
    SUPPORTED_DEVICES := bananapi,bpi-rv2-nor
endef
TARGET_DEVICES += bpi-rv2-nor
