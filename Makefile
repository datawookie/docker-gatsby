IMAGE = datawookie/gatsby

build:
	docker build --platform=linux/amd64 -t  .

build-no-cache:
	docker build --no-cache --platform=linux/amd64 -t $(IMAGE) .

push:
	docker push $(IMAGE)

develop:
	docker run -it -p 8000:8000 -v ${PWD}:/site $(IMAGE)
