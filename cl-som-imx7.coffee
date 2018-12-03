deviceTypesCommon = require '@resin.io/device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon

module.exports =
	version: 1
	slug: 'cl-som-imx7'
	aliases: [ 'cubox-i' ]
	name: 'CompuLab imx7 SoM'
	arch: 'armv7hf'
	state: 'experimental'

	instructions: commonImg.instructions
	gettingStartedLink:
		windows: 'http://docs.resin.io/#/pages/installing/gettingStarted-cl-som-imx7.md#windows'
		osx: 'http://docs.resin.io/#/pages/installing/gettingStarted-cl-som-imx7.md#on-mac-and-linux'
		linux: 'http://docs.resin.io/#/pages/installing/gettingStarted-cl-som-imx7.md#on-mac-and-linux'
	supportsBlink: false

	options: [ networkOptions.group ]

	yocto:
		machine: 'cl-som-imx7'
		image: 'resin-image-flasher'
		fstype: 'resinos-img'
		version: 'yocto-krogoth'
		deployArtifact: 'resin-image-flasher-cl-som-imx7.resinos-img'
		compressed: true

	configuration:
		config:
			partition:
				primary: 1
			path: '/config.json'

initialization: commonImg.initialization
