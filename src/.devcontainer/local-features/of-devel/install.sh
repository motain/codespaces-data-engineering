#!/bin/bash

set -xe

su -s /bin/bash $_REMOTE_USER <<'EOF'
	set -xe
	export PATH=/home/linuxbrew/.linuxbrew/bin:$PATH
EOF

echo /home/linuxbrew/.linuxbrew/bin/fish | tee -a /etc/shells
chsh -s /home/linuxbrew/.linuxbrew/bin/fish vscode

echo 'Done!'
