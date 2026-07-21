#!/usr/bin/env bash

# Try to fix sporadic btrfs corruption
sudo grubby --update-kernel=ALL --args="nvme_core.default_ps_max_latency_us=0"
