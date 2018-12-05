#
# compulab imx7 iot gate
#

IMAGE_FSTYPES_append_cl-som-imx7 = " resinos-img"

# Customize resinos-img
RESIN_IMAGE_BOOTLOADER_cl-som-imx7 = "u-boot-compulab"

RESIN_BOOT_PARTITION_FILES_cl-som-imx7 = " \
    SPL-cl-som-imx7:/SPL \
    u-boot-${MACHINE}.img:/u-boot.img \
    ${KERNEL_IMAGETYPE}${KERNEL_INITRAMFS}-${MACHINE}.bin:/${KERNEL_IMAGETYPE} \
    zImage-imx7d-cl-som-imx7.dtb:/imx7d-cl-som-imx7.dtb \
    zImage-imx7d-sbc-imx7.dtb:/imx7d-sbc-imx7.dtb \
    zImage-imx7d-sbc-iot-imx7.dtb:/imx7d-sbc-iot-imx7.dtb \
    "

IMAGE_INSTALL_append_cl-som-imx7 = " \
"

IMAGE_CMD_resinos-img_append_cl-som-imx7 () {
    dd if=${DEPLOY_DIR_IMAGE}/SPL of=${RESIN_RAW_IMG} bs=1K seek=1 conv=notrunc
    dd if=${DEPLOY_DIR_IMAGE}/u-boot.img of=${RESIN_RAW_IMG} bs=1K seek=64 conv=notrunc
}

# IMAGE_CMD_resinos-img_append_cl-som-imx7 () {
#     dd if=/dev/zero count=640 bs=1K | tr '\000' '\377' > ${DEPLOY_DIR_IMAGE}/cl-som-imx7-firmware
#     dd if=${DEPLOY_DIR_IMAGE}/SPL of=${DEPLOY_DIR_IMAGE}/cl-som-imx7-firmware bs=1K seek=1 conv=notrunc
#     dd if=${DEPLOY_DIR_IMAGE}/u-boot.img of=${DEPLOY_DIR_IMAGE}/cl-som-imx7-firmware bs=1K seek=64 conv=notrunc

#     dd if=${DEPLOY_DIR_IMAGE}/cl-som-imx7-firmware of=${RESIN_RAW_IMG} bs=512 seek=2 skip=2 conv=fsync
# }
