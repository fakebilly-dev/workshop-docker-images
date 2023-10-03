#!/usr/bin/env bash
set -ex

cat >/etc/profile.d/nvm.sh <<'EOF'
export NVM_BIN=/usr/local/nvm/versions/node/$NODE_VERSION/bin
export NVM_DIR=/usr/local/nvm
export NODE_PATH=/usr/local/nvm/versions/node/$NODE_VERSION
export PATH=$PATH:$NODE_PATH/bin
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[[ -r $NVM_DIR/bash_completion ]] && \. $NVM_DIR/bash_completion
EOF

mkdir -pv /usr/local/nvm
wget -qO /usr/local/nvm/install_nvm_0.39.5.sh https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh
chmod +x /usr/local/nvm/install_nvm_0.39.5.sh
