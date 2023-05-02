#!/bin/bash

  cd ~/klipper
  git remote add probe-drop-first https://github.com/hifihedgehog/klipper.git
  git fetch probe-drop-first
  git cherry-pick ad23f41ce542b8a637ef91a57dad5d4e2ee7b6f1
  sed -i 's/TRSYNC_TIMEOUT = 0.025/TRSYNC_TIMEOUT = 0.05/g' ~/klipper/klippy/mcu.py
  sudo service klipper restart
