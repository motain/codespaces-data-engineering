#!/bin/bash

set -xe

bash ./install-brew.sh

su - $_REMOTE_USER <<EOF
	set -xe
	ulimit -n `ulimit -Hn`
	export PATH=/home/linuxbrew/.linuxbrew/bin:$PATH
	brew install \
		starship \
		direnv \
		lazygit \
		zellij \
		fish \
		gh \
		ripgrep \
		fd \
		fzf \
		lf \
		pipx \
		node \
		awscli \
		emacs \
		nvim \
		cmake \
		libtool \
		tmux \
		atuin \
		micromamba \
		postgresql@14 \
		k9s \
		kubectx \
		saml2aws \
		zoxide
	pipx install \
		poetry \
		meltano \
		rich-cli
EOF


su - $_REMOTE_USER <<EOF
	set -xe
	export PATH=/home/linuxbrew/.linuxbrew/bin:$PATH
	npm install -g @devcontainers/cli
	curl https://sdk.cloud.google.com > install.sh
	bash install.sh --disable-prompts
	rm install.sh
EOF

echo 'Done!'
