#!/bin/bash -i

set -e

bash ./install-brew.sh

su - $_REMOTE_USER <<EOF
	set -e
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
		node \
		pipx \
		awscli \
		pipx \
		emacs \
		nvim \
		cmake \
		libtool \
		tmux \
		atuin \
		zoxide
	git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.emacs.d
	~/.emacs.d/bin/doom install --fonts --force
	# no more commands after doom
EOF

su - $_REMOTE_USER <<EOF
	set -e
	export PATH=/home/linuxbrew/.linuxbrew/bin:$PATH
	npm install -g @devcontainers/cli
EOF

echo 'Done!'
