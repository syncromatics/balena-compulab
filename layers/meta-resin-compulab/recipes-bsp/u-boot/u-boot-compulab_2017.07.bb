inherit resin-u-boot

require recipes-bsp/u-boot/u-boot.inc

UBOOT_KCONFIG_SUPPORT = "1"

DESCRIPTION = "u-boot which includes support for CompuLab boards."
LICENSE = "GPLv2+"
LIC_FILES_CHKSUM = "file://Licenses/README;md5=a2c678cfd4a4d97135585cad908541c6"

SECTION = "bootloader"
PROVIDES += "u-boot"

SRCBRANCH = "master"
SRCREV = "v2017.07"
SRC_URI = "git://git.denx.de/u-boot.git;branch=${SRCBRANCH}"
#SRC_URI[md5sum] = "fd8234c5b3a460430689848c1f16acef"

UBOOT_MAKE_TARGET = ""
UBOOT_MACHINE = "cl-som-imx7_defconfig"

SPL_BINARY = "SPL"

UBOOT_SUFFIX = "img"

FILESEXTRAPATHS_append := ":${THISDIR}/u-boot-compulab-2017-07"
FILESEXTRAPATHS_append := ":${THISDIR}/patches"

include u-boot-compulab_cl-som-imx7.inc

S = "${WORKDIR}/git"

PACKAGE_ARCH = "${MACHINE_ARCH}"
COMPATIBLE_MACHINE = "(cl-som-imx7)"

# # u-boot wants to build a libfdt Python module
#inherit pythonnative
