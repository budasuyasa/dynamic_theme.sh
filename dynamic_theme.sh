#!/usr/bin/env bash
while :; do
	currentTheme=$(gsettings get org.gnome.desktop.interface gtk-theme)
	currenttime=$(date +%H:%M)
	if [[ "$currenttime" > "18:00" ]] || [[ "$currenttime" < "07:00" ]]; then
		if [[ "$currentTheme" == "'Adwaita'" ]]; then
			gsettings set org.gnome.desktop.interface gtk-theme Adwaita-dark
		fi
	elif [[ $currentTheme == "'Adwaita-dark'" ]]; then
		gsettings set org.gnome.desktop.interface gtk-theme Adwaita
	fi
	sleep 60
done
