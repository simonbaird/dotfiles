#!/usr/bin/env bash
set -euo pipefail

sudo dnf install cronie
sudo systemctl enable crond
sudo systemctl start crond
