VERSION ?= v0.0.1
IMAGE_REPO ?= kubernetes-docker-local.artifactory.eng.vmware.com
IMAGE_NAME ?= configmapsyncer
all:
	docker build -t $(IMAGE_REPO)/${IMAGE_NAME}:$(VERSION) .

