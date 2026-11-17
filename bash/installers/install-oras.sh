#!/usr/bin/env bash
set -euo pipefail

ORAS_VERSION=v1.4.0
curl -LO "https://github.com/oras-project/oras/releases/download/${ORAS_VERSION}/oras_${ORAS_VERSION#v}_linux_amd64.tar.gz"
tar xzf "oras_${ORAS_VERSION#v}_linux_amd64.tar.gz" oras
sudo mv oras /usr/bin/oras
