include resin-image.inc

IMAGE_FSTYPES_cl-som-imx7 = " ${@bb.utils.contains('RESINHUP', 'yes', 'tar', '', d)}"

IMAGE_ROOTFS_MAXSIZE = "5869568"
