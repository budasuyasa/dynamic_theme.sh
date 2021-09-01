#!/usr/bin/env bash

if [ $EUID != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi

echo "🌗 Dynamic GTK theme changer based on specified time for Gnome desktop environment."
echo "✅ Make sure Adwaita and Adwaita-dark already installed on your system."
echo "⏰ Adwaita-dark will start from 19.00 to 07.00. Edit dynamic_theme.sh if you want anything else."
echo ""
echo -e "\e[31mUse this script by your own risk!\033[0m"
read -p "Continue? [y/N]: " confirm

if [[ $confirm == "y"  ]] || [[ $confirm == "Y"  ]]; then
	echo "Installing..."
	cp ./dynamic_theme.sh /opt
	chmod +x /opt/dynamic_theme.sh
	cp ./dynamic_theme.service /lib/systemd/system/
	systemctl daemon-reload
	systemctl enable dynamic_theme.service
	systemctl start dynamic_theme.service
	echo -e "\e[32mDone\033[0m"
else
	echo "Aborted."
fi


