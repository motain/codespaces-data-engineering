#!/bin/bash -i

set -e

su - $_REMOTE_USER <<EOF
	set -e
	export PATH=/home/linuxbrew/.linuxbrew/bin:$PATH
EOF

echo 'Done!'
