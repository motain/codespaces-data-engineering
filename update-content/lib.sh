#!/bin/bash

set -xe

clone() (
    repo=$1
	branch=main
	url=https://github.com/motain/$repo.git
	cd /workspaces
	git clone $url
	fix_remote $repo $branch
	zoxide add `pwd`/$repo
	emacs --fg-daemon --eval "(projectile-add-known-project \"`pwd`/$repo\")" --eval '(kill-emacs)'
)

fix_remote() (
    repo=$1
    branch=$2
	cd /workspaces/$repo
	git config branch.$branch.remote origin
	git config branch.$branch.merge refs/heads/$branch
	git config branch.$branch.pushRemote origin
)

make_setup() (
    repo=$1
	cd /workspaces/$repo
	make setup
)
