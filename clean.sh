#!/bin/bash

source layers/poky/oe-init-build-env
MACHINE=cl-som-imx7 bitbake resin-image -c clean
MACHINE=cl-som-imx7 bitbake resin-image-flasher -c clean

MACHINE=cl-som-imx7 bitbake u-boot -c clean
MACHINE=cl-som-imx7 bitbake u-boot -c cleansstate

MACHINE=cl-som-imx7 bitbake u-boot-compulab -c clean
MACHINE=cl-som-imx7 bitbake u-boot-compulab -c cleansstate

MACHINE=cl-som-imx7 bitbake u-boot -c patch
MACHINE=cl-som-imx7 bitbake u-boot -c compile

MACHINE=cl-som-imx7 bitbake u-boot-compulab -c patch
MACHINE=cl-som-imx7 bitbake u-boot-compulab -c compile
