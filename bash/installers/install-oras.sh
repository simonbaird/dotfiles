#!/usr/bin/env bash
set -euo pipefail

ORAS_VERSION=$(curl -fsSL -o /dev/null -w '%{url_effective}' https://github.com/oras-project/oras/releases/latest)
ORAS_VERSION=${ORAS_VERSION##*/}
tmpdir=$(mktemp -d /tmp/oras.XXXXXXXX)
trap 'rm -rf "$tmpdir"' EXIT

curl -fL -o "$tmpdir/oras_${ORAS_VERSION#v}_linux_amd64.tar.gz" "https://github.com/oras-project/oras/releases/download/${ORAS_VERSION}/oras_${ORAS_VERSION#v}_linux_amd64.tar.gz"
tar xzf "$tmpdir/oras_${ORAS_VERSION#v}_linux_amd64.tar.gz" -C "$tmpdir" oras
sudo mv "$tmpdir/oras" /usr/bin/oras
