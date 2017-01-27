.PHONY: build

all: build push

REGISTRY=jwplayer
IMAGE=k8s-filebeat
TAG=1.0

build:
	docker build -t $(IMAGE):$(TAG) -t $(REGISTRY)/$(IMAGE):$(TAG) .

push:
	docker push $(REGISTRY)/$(IMAGE):$(TAG)
	docker push $(REGISTRY)/$(IMAGE):latest

