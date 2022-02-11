# About this Repo

[![Build Status](https://github.com/wodby/base-memcached/workflows/Build%20docker%20image/badge.svg)](https://github.com/wodby/base-memcached/actions)
[![Docker Pulls](https://img.shields.io/docker/pulls/wodby/base-memcached.svg)](https://hub.docker.com/r/wodby/base-memcached)
[![Docker Stars](https://img.shields.io/docker/stars/wodby/base-memcached.svg)](https://hub.docker.com/r/wodby/base-memcached)
[![Docker Layers](https://images.microbadger.com/badges/image/wodby/base-memcached.svg)](https://microbadger.com/images/wodby/base-memcached)

This repository is a fork of https://github.com/docker-library/memcached with a few changes:

* Only alpine-based images
* All images based on [alpine](https://github.com/wodby/alpine) 3.13 version due to [this](https://github.com/alpinelinux/docker-alpine/issues/182) change in 3.14 that prevents us from running it on older docker versions

## Docker Images

* All images based on Alpine Linux
* Base image: [wodby/alpine](https://github.com/wodby/alpine)
* [Docker Hub](https://hub.docker.com/r/wodby/base-memcached)

Supported tags and respective `Dockerfile` links:

* `1.6.14`, `1.6`, `1`, `latest` [_(Dockerfile)_](https://github.com/wodby/base-memcached/tree/master/2.4/alpine/Dockerfile.wodby)

All images built for `linux/amd64` and `linux/arm64`
