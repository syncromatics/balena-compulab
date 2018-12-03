.PHONY: build build-inner

build:
	docker build -t tempbuild .
	docker run \
		-v $(PWD)/:/app \
		--privileged \
		tempbuild \
		make build-inner

build-inner:
	dockerd &>/var/log/docker.log &
	git submodule update --init --recursive
	mkdir -p build/conf
	#./balena-yocto-scripts/build/barys --remove-build --dry-run
	cp layers/meta-resin-compulab/conf/samples/local.conf.sample build/conf/local.conf
	sudo -u appuser ./balena-yocto-scripts/build/barys
