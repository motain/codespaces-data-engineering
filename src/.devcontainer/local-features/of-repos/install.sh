#!/bin/bash

set -xe

su $_REMOTE_USER <<'EOF'
	set -xe
	export PATH=/home/linuxbrew/.linuxbrew/bin:$PATH
	mkdir /home/vscode/workspaces
	clone() (
		org=$1
		repo=$2
		branch=main
		url=https://github.com/$org/$repo.git
		cd /home/vscode/workspaces
		gh repo clone $url
		fix_remote $repo $branch
		zoxide add `pwd`/$repo
		emacs --fg-daemon --eval "(projectile-add-known-project \"`pwd`/$repo\")" --eval '(kill-emacs)'
	)
	fix_remote() (
		repo=$1
		branch=$2
		cd /home/vscode/workspaces/$repo
		git config branch.$branch.remote origin
		git config branch.$branch.merge refs/heads/$branch
		git config branch.$branch.pushRemote origin
	)

	clone motain codespaces-data-engineering
EOF

echo 'Done!'
