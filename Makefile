# add
# "postCreateCommand": "make post-create",
# to devcontainer.json
.PHONY: on-create
on-create:
	env
	echo pass

.PHONY: update-content
update-content:
	env
	/workspaces/codespaces-data-engineering/update-content/01.sh

.PHONY: post-create
post-create:
	env
ifeq ($(CODESPACES), true)
	run-parts /workspaces/codespaces-data-engineering/post-create
endif

# you have to generate the GITHUB_TOKEN manually to be able to push to ghcr.io
.PHONY: build
build:
	devcontainer build --workspace-folder src

# backup the dotfiles
.PHONY: backup
backup:
	cp ~/.config/fish/config.fish dotfiles/fish/config.fish
	cp ~/.config/direnv/direnv.toml dotfiles/direnv/direnv.toml
	cp ~/.config/zellij/config.kdl dotfiles/zellij/config.kdl
	cp ~/.config/zellij/layouts/minimal.kdl dotfiles/zellij/layouts/minimal.kdl
	cp ~/.gitconfig dotfiles/git/.gitconfig
	cp ~/.doom.d/config.el dotfiles/doomemacs/config.el
	cp ~/.doom.d/init.el dotfiles/doomemacs/init.el
	cp ~/.doom.d/packages.el dotfiles/doomemacs/packages.el
	cp ~/.doom.d/snippets/text-mode/* dotfiles/doomemacs/snippets/text-mode
	cp ~/.config/lazygit/config.yml dotfiles/lazygit/config.yml
	cp ~/.config/atuin/config.toml dotfiles/atuin/config.toml
	cp ~/.config/starship.toml dotfiles/starship/starship.toml
	cp ~/.local/bin/happy-fermat dotfiles/bin/happy-fermat
	cp ~/.local/bin/happy-emacs dotfiles/bin/happy-emacs

# install the dotfiles
.PHONY: install
install:
	mkdir -p ~/.config/fish
	cp dotfiles/fish/config.fish ~/.config/fish/config.fish
	mkdir -p ~/.config/direnv
	cp dotfiles/direnv/direnv.toml ~/.config/direnv/direnv.toml
	mkdir -p ~/.config/zellij/layouts
	cp dotfiles/zellij/config.kdl ~/.config/zellij/config.kdl
	cp dotfiles/zellij/layouts/minimal.kdl ~/.config/zellij/layouts/minimal.kdl
	cp dotfiles/git/.gitconfig ~/.gitconfig
	mkdir -p ~/.doom.d
	cp dotfiles/doomemacs/config.el ~/.doom.d/config.el
	cp dotfiles/doomemacs/init.el ~/.doom.d/init.el
	cp dotfiles/doomemacs/packages.el ~/.doom.d/packages.el
	cp -r dotfiles/doomemacs/snippets ~/.doom.d/
	cat dotfiles/bash/.bashrc >> ~/.bashrc
	mkdir -p ~/.config/lazygit
	cp dotfiles/lazygit/config.yml ~/.config/lazygit/config.yml
	mkdir -p ~/.config/atuin
	cp dotfiles/atuin/config.toml ~/.config/atuin/config.toml
	mkdir -p ~/.config
	cp dotfiles/starship/starship.toml ~/.config/starship.toml
	mkdir -p ~/.local/bin
	cp dotfiles/bin/happy-fermat ~/.local/bin/happy-fermat
	cp dotfiles/bin/happy-emacs ~/.local/bin/happy-emacs
