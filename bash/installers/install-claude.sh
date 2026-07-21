#!/usr/bin/env bash
set -euo pipefail

curl -fsSL https://claude.ai/install.sh -o claude-install.sh
chmod +x claude-install.sh
./claude-install.sh
