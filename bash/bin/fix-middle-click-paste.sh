#!/bin/env bash

gsettings get org.gnome.desktop.interface gtk-enable-primary-paste

gsettings set org.gnome.desktop.interface gtk-enable-primary-paste true

gsettings get org.gnome.desktop.interface gtk-enable-primary-paste
