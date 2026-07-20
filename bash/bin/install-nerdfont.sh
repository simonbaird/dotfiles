#!/bin/env bash

sudo dnf install --nogpgcheck \
  --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' \
  terra-release terra-gpg-keys

sudo dnf install sourcecodepro-nerd-fonts
