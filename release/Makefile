APP_VERSION = $(shell cat version.txt)
IMAGE_NAME = nathamanath/elixir_release
REGISTRY_URL = $(shell cat registry.txt)

build:
	docker build --no-cache -t $(IMAGE_NAME) .
	docker tag $(IMAGE_NAME) $(REGISTRY_URL)/$(IMAGE_NAME):latest
	docker tag $(IMAGE_NAME) $(REGISTRY_URL)/$(IMAGE_NAME):$(APP_VERSION)

push:
	docker push $(REGISTRY_URL)/$(IMAGE_NAME):latest
	docker push $(REGISTRY_URL)/$(IMAGE_NAME):$(APP_VERSION)

release: build push
