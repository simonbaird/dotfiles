#!/bin/env bash

# Rudely assume you don't have any other xkb-options
gsettings set org.gnome.desktop.input-sources xkb-options "['ctrl:nocaps']"
