#!/bin/bash

set -xe

bash ./install-brew.sh

su -s /bin/bash $_REMOTE_USER <<'EOF'
	set -xe
	ulimit -n `ulimit -Hn`
	export PATH=/home/vscode/.local/bin:/home/linuxbrew/.linuxbrew/bin:$PATH
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
		go \
		borkdude/brew/babashka \
		babashka/brew/bbin \
		borkdude/brew/jet \
		hashicorp/tap/terraform \
		clojure/tools/clojure \
		clojure-lsp/brew/clojure-lsp-native \
		zoxide
	go install github.com/jessfraz/dockfmt@latest
	go install mvdan.cc/sh/v3/cmd/shfmt@latest
	pipx install \
		poetry \
		meltano \
		rich-cli \
		black \
		pyflakes \
		isort \
		pipenv \
		nose \
		pytest
	bbin install io.github.babashka/neil
	neil -v
EOF


su -s /bin/bash $_REMOTE_USER <<'EOF'
	set -xe
	export PATH=/home/linuxbrew/.linuxbrew/bin:$PATH
	npm install -g @devcontainers/cli
	curl https://sdk.cloud.google.com > /tmp/install.sh
	bash /tmp/install.sh --disable-prompts
	rm /tmp/install.sh
	wget -O /tmp/lein https://codeberg.org/leiningen/leiningen/raw/branch/stable/bin/lein
	chmod a+x /tmp/lein
	mkdir -p $HOME/.local/bin
	mv /tmp/lein $HOME/.local/bin
EOF

echo 'Done!'
