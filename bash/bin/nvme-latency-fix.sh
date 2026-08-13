#!/usr/bin/env bash

# Try to fix sporadic btrfs corruption by disabling NVMe power-saving states.
sudo grubby --update-kernel=ALL --args="nvme_core.default_ps_max_latency_us=0"

# To check whether the setting is currently applied:
#
#   # What the driver is actually using right now (definitive)
#   cat /sys/module/nvme_core/parameters/default_ps_max_latency_us
#
#   # Whether it was passed at boot
#   grep -o 'nvme_core.default_ps_max_latency_us=[0-9]*' /proc/cmdline
#
#   # Whether grubby wrote it persistently for future boots
#   sudo grubby --info=ALL | grep -o 'nvme_core[^" ]*'
#
# A value of 0 means the fix is active.
