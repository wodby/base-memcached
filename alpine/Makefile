-include env_make

TAG ?= $(MEMCACHED_VER)
ALPINE_VER ?= 3.15

PLATFORM ?= linux/amd64

REPO = wodby/base-memcached
NAME = base-memcached-$(MEMCACHED_VER)

ifeq ($(BASE_IMAGE_STABILITY_TAG),)
    BASE_IMAGE_TAG := $(ALPINE_VER)
else
    BASE_IMAGE_TAG := $(ALPINE_VER)-$(BASE_IMAGE_STABILITY_TAG)
endif

.PHONY: build buildx-build buildx-push test push shell run start stop logs clean release

default: build

build:
	docker build -t $(REPO):$(TAG) \
		-f Dockerfile.wodby \
		--build-arg BASE_IMAGE_TAG=$(BASE_IMAGE_TAG) ./

buildx-build:
	docker buildx build -t $(REPO):$(TAG) \
	    --platform $(PLATFORM) \
		-f Dockerfile.wodby \
		--build-arg BASE_IMAGE_TAG=$(BASE_IMAGE_TAG) ./

buildx-push:
	docker buildx build \
    	--build-arg BASE_IMAGE_TAG=$(BASE_IMAGE_TAG) \
	    --platform $(PLATFORM) \
		-f Dockerfile.wodby \
		--push -t $(REPO):$(TAG) ./

test:
	IMAGE=$(REPO):$(TAG) ./test.sh

push:
	docker push $(REPO):$(TAG)

shell:
	docker run --rm --name $(NAME) -i -t $(PORTS) $(VOLUMES) $(ENV) $(REPO):$(TAG) /bin/bash

run:
	docker run --rm --name $(NAME) $(PORTS) $(VOLUMES) $(ENV) $(REPO):$(TAG) $(CMD)

start:
	docker run -d --name $(NAME) $(PORTS) $(VOLUMES) $(ENV) $(REPO):$(TAG)

stop:
	docker stop $(NAME)

logs:
	docker logs $(NAME)

clean:
	-docker rm -f $(NAME)

release: build push
