#!/usr/bin/env bash
set -e

# get glxinfo
apt-get install -y mesa-utils

# update gfx drivers
apt-add-repository ppa:oibaf/graphics-drivers
apt-get update
apt-get dist-upgrade -y
