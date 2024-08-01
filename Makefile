IMAGE = datawookie/gatsby
PLATFORM = linux/amd64
NODE_VERSION = $(shell grep "FROM" Dockerfile | sed 's/.*://;s/-.*//')
IMAGE_LATEST = $(IMAGE):latest
IMAGE_VERSION = $(IMAGE):$(NODE_VERSION)

build:
	docker build --platform=$(PLATFORM) -t $(IMAGE_LATEST) -t $(IMAGE_VERSION) .

build-no-cache:
	docker build --no-cache --platform=$(PLATFORM) -t $(IMAGE_LATEST) -t $(IMAGE_VERSION) .

push:
	docker push $(IMAGE_LATEST)
	docker push $(IMAGE_VERSION)
