#!/usr/bin/env bash
set -euo pipefail

sudo dnf copr enable chmouel/tektoncd-cli
sudo dnf install tektoncd-cli
