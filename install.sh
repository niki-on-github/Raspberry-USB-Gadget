#!/bin/bash
# --------------------------------------------------------------------------
# This script installs files and services specific to this project.
#
# Author: Bernhard Bablok
# License: GPL3
#
# Website: https://github.com/bablokb/raspi2go
#
# --------------------------------------------------------------------------

PROJECT="raspi2go"

install_files() {
  echo -e "[INFO] installing project files" 2>&1

  for f in `find $(dirname "$0")/files/ -type f -not -name "*.pyc"`; do
    target="${f#*files}"
    target_dir="${target%/*}"
    [ ! -d "$target_dir" ] && mkdir -p "$target_dir"
    cp "$f" "$target"
    chown root:root "$target"
  done

  chmod 755 "/usr/local/sbin/${PROJECT}.sh"
}

configure_system() {
  # update /boot/config.txt for dw2
  if ! grep -q "^dtoverlay=dwc2" /boot/config.txt ; then
    echo -e "[INFO] configuring dw2 in /boot/config.txt" 2>&1
    echo -e "[INFO] note: reboot required!" 2>&1
    echo "dtoverlay=dwc2" >> /boot/config.txt
  fi
}

enable_services() {
  echo -e "[INFO] enabeling ${PROJECT}.service" 2>&1
  systemctl enable "${PROJECT}.service"
}

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run with sudo"
   exit 1
fi

install_files
configure_system
enable_services

echo "[INFO] installation completed"
