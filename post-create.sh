#!/bin/bash -i

set -xe

if [ "$CODESPACES" == "true" ]; then
	git pull
	make install
	echo $ATUIN_LOGIN | bash -i
	~/.emacs.d/bin/doom sync
fi
