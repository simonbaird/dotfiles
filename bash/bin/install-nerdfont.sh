#!/usr/bin/env bash
set -euo pipefail

sudo dnf install --nogpgcheck \
  --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' \
  terra-release terra-gpg-keys

sudo dnf install sourcecodepro-nerd-fonts
