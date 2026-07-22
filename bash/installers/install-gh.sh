#!/usr/bin/env bash
set -euo pipefail

# https://github.com/cli/cli/blob/trunk/docs/install_linux.md#dnf5
sudo dnf install dnf5-plugins
sudo dnf config-manager addrepo --from-repofile=https://cli.github.com/packages/rpm/gh-cli.repo
sudo dnf install gh
