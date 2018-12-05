.PHONY: build build-inner

build:
	mkdir -p /tmp/scratch/docker
	docker build -t tempbuild .
	docker run \
		-v $(PWD)/:/app \
		-v /tmp/scratch/docker:/scratch/docker \
		--privileged \
		tempbuild \
		make build-inner

clean:
	mkdir -p /tmp/scratch/docker
	docker build -t tempbuild .
	docker run \
		-v $(PWD)/:/app \
		-v /tmp/scratch/docker:/scratch/docker \
		--privileged \
		tempbuild \
		make clean-image

start-did:
	mkdir -p /scratch/docker
	dockerd --data-root /scratch/docker --storage-driver aufs &>/var/log/docker.log &

build-inner: start-did clean-image
	git submodule update --init --recursive
	#sudo -u appuser ./balena-yocto-scripts/build/barys --remove-build --dry-run
	#cp layers/meta-resin-compulab/conf/samples/local.conf.sample build/conf/local.conf
	sudo -u appuser ./balena-yocto-scripts/build/barys
	mkdir -p artifacts
	cp ./build/tmp/deploy/images/cl-som-imx7/resin-image-cl-som-imx7.resinos-img ./artifacts/resin.img
	cp ./build/tmp/deploy/images/cl-som-imx7/resin-image-flasher-cl-som-imx7.resinos-img ./artifacts/resin-flasher.img

clean-image:
	mkdir -p /scratch/docker
	dockerd --data-root /scratch/docker --storage-driver aufs &>/var/log/docker.log &
	sudo -u appuser ./clean.sh

run-docker:
	mkdir -p /tmp/scratch/docker
	docker build -t tempbuild .
	docker run \
		-v $(PWD)/:/app \
		-v /tmp/scratch/docker:/scratch/docker \
		--privileged \
		-it \
		tempbuild bash
