IMAGE = datawookie/gatsby
NODE_VERSION = $(shell grep "FROM" Dockerfile | sed 's/.*://;s/-.*//')
IMAGE_LATEST = $(IMAGE):latest
IMAGE_VERSION = $(IMAGE):$(NODE_VERSION)

build:
	docker build --platform=linux/amd64 -t $(IMAGE_LATEST) -t $(IMAGE_VERSION) .

build-no-cache:
	docker build --no-cache --platform=linux/amd64 -t $(IMAGE_LATEST) -t $(IMAGE_VERSION) .

push:
	docker push $(IMAGE_LATEST)
	docker push $(IMAGE_VERSION)

develop:
	docker run -it -p 8000:8000 -v ${PWD}:/site $(IMAGE)
