#!/usr/bin/env bash

# https://kind.sigs.k8s.io/docs/user/quick-start/#installing-from-release-binaries

curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.32.0/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind
