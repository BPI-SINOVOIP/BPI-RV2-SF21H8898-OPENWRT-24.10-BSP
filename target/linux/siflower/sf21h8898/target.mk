ARCH:=riscv64
SUBTARGET:=sf21h8898
BOARDNAME:=Siflower SF21H8898 based boards
FEATURES+=fpu nand pci pcie separate_ramdisk
DEFAULT_PACKAGES += fitblk
KERNELNAME:=Image

define Target/Description
	Build firmware images for Siflower SF19A2890 based boards.
endef

