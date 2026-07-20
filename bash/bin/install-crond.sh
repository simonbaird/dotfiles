#!/bin/env bash

sudo dnf install chronie
sudo systemctl enable crond
sudo systemctl start crond
