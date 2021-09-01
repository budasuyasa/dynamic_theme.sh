#!/usr/bin/env bash

if [ $EUID != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi

read -p "Uninstall dynamic_theme.sh service? [y/N]: " confirm

if [[ $confirm == "y"  ]] || [[ $confirm == "Y"  ]]; then
	echo "Working..."
	rm /opt/dynamic_theme.sh
	systemctl stop dynamic_theme.service
	systemctl disable dynamic_theme.service
	rm /lib/systemd/system/dynamic_theme.service
	systemctl daemon-reload
	systemctl reset-failed
	echo -e "\e[32mDone\033[0m"
else
	echo "Aborted."
fi


