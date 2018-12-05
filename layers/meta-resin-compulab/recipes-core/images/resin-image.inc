#
# compulab imx7 iot gate
#

IMAGE_FSTYPES_append_cl-som-imx7 = " resinos-img"

# Customize resinos-img
RESIN_IMAGE_BOOTLOADER_cl-som-imx7 = "u-boot-compulab"

RESIN_BOOT_PARTITION_FILES_cl-som-imx7 = " \
    ${KERNEL_IMAGETYPE}-${MACHINE}.bin:/${KERNEL_IMAGETYPE} \
    zImage-imx7d-cl-som-imx7.dtb:/imx7d-cl-som-imx7.dtb \
    zImage-imx7d-sbc-imx7.dtb:/imx7d-sbc-imx7.dtb \
    zImage-imx7d-sbc-iot-imx7.dtb:/imx7d-sbc-iot-imx7.dtb \
    "

IMAGE_CMD_resinos-img_append_cl-som-imx7 () {
    # cl-som-imx7 needs uboot written at a specific location
    dd if=${DEPLOY_DIR_IMAGE}/u-boot-${MACHINE}.imx of=${RESIN_RAW_IMG} conv=notrunc seek=2 bs=512
}
