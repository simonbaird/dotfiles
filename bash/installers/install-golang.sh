#!/usr/bin/env bash
set -euo pipefail

sudo dnf install golang

GOTOOLCHAIN=auto go install github.com/asdf-vm/asdf/cmd/asdf@latest
asdf plugin add golang
