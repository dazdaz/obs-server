#!/usr/bin/env bash
set -e

echo "Install FFMPEG"
apt-get install -y ffmpeg

echo "Install OBS"
add-apt-repository -y ppa:obsproject/obs-studio
apt-get update
apt-get install -y obs-studio


