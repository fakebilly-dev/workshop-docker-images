#!/usr/bin/env bash
set -ex

(for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do apt-get remove $pkg; done) || true
(apt-get purge docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras) || true
(rm -rf /var/lib/docker && rm -rf /var/lib/containerd) || true


# Add Docker's official GPG key:
apt-get update
apt-get install -y ca-certificates curl gnupg
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update
apt-get install -y docker-ce=5:24.0.6-1~ubuntu.20.04~focal docker-ce-cli=5:24.0.6-1~ubuntu.20.04~focal containerd.io docker-buildx-plugin docker-compose-plugin

usermod -aG docker monet
