.PHONY: build
build:
	devcontainer build --workspace-folder src

.PHONY: up
up:
	devcontainer up --workspace-folder src

.PHONY: push
push:
	echo ${GHP_TOKEN} | docker login ghcr.io -u onefootball-data-insights --password-stdin
	devcontainer build --workspace-folder src --push true --image-name ghcr.io/motain/codespaces-data-engineering
