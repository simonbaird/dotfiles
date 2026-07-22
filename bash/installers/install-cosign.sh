#!/usr/bin/env bash
set -euo pipefail

# https://docs.sigstore.dev/cosign/system_config/installation/
ASDF_GOLANG_VERSION=$(asdf list golang 2>/dev/null | tail -1 | tr -d ' ') go install github.com/sigstore/cosign/v3/cmd/cosign@latest
