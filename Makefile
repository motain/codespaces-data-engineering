# add
# "postCreateCommand": "make post-create",
# to devcontainer.json
PHONY: post-create
post-create:
	./post-create.sh

# backup the dotfiles
.PHONY: backup
backup:
	cp ~/.config/fish/config.fish dotfiles/fish/config.fish
	cp ~/.config/direnv/direnv.toml dotfiles/direnv/direnv.toml
	cp ~/.config/zellij/config.kdl dotfiles/zellij/config.kdl
	cp ~/.gitconfig dotfiles/git/.gitconfig
	cp ~/.doom.d/config.el dotfiles/doomemacs/config.el
	cp ~/.doom.d/init.el dotfiles/doomemacs/init.el
	cp ~/.doom.d/packages.el dotfiles/doomemacs/packages.el
	cp ~/.config/lazygit/config.yml dotfiles/lazygit/config.yml
	cp ~/.config/atuin/config.toml dotfiles/atuin/config.toml

# install the dotfiles
.PHONY: install
install:
	mkdir -p ~/.config/fish
	cp dotfiles/fish/config.fish ~/.config/fish/config.fish
	mkdir -p ~/.config/direnv
	cp dotfiles/direnv/direnv.toml ~/.config/direnv/direnv.toml
	mkdir -p ~/.config/zellij
	cp dotfiles/zellij/config.kdl ~/.config/zellij/config.kdl
	cp dotfiles/git/.gitconfig ~/.gitconfig
	mkdir -p ~/.doom.d
	cp dotfiles/doomemacs/config.el ~/.doom.d/config.el
	cp dotfiles/doomemacs/init.el ~/.doom.d/init.el
	cp dotfiles/doomemacs/packages.el ~/.doom.d/packages.el
	cat dotfiles/bash/.bashrc >> ~/.bashrc
	mkdir -p ~/.config/lazygit
	cp dotfiles/lazygit/config.yml ~/.config/lazygit/config.yml
	mkdir -p ~/.config/atuin
	cp dotfiles/atuin/config.toml ~/.config/atuin/config.toml
