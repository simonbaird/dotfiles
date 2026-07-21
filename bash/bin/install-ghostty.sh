#!/usr/bin/env bash
set -euo pipefail

sudo dnf copr enable scottames/ghostty
sudo dnf install ghostty
