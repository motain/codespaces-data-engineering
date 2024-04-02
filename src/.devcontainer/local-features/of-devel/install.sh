#!/bin/bash

set -xe

su - $_REMOTE_USER <<EOF
	set -xe
	export PATH=/home/linuxbrew/.linuxbrew/bin:$PATH
EOF

echo 'Done!'
