#!/usr/bin/env bash

source .env
docker push ${USERNAME}/${REPOSITORY}:${TAG}
