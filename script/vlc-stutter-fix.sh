#!/usr/bin/env bash

sudo apt-get install -y dracut
sudo echo "options drm_kms_helper poll=N" >> /etc/modprobe.d/local.conf
sudo dracut --force
