#!/usr/bin/env bash
set -euo pipefail

sudo dnf install chronie
sudo systemctl enable crond
sudo systemctl start crond
