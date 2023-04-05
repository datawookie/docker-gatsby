build:
	docker build -t datawookie/gatsby .

push:
	docker push datawookie/gatsby

develop:
	docker run -it -p 8000:8000 -v ${PWD}:/site datawookie/gatsby
