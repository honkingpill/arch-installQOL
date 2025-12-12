#!/bin/bash

# ==========
# Here's some of my most-used packages
# ==========
PACKAGES=(
    	"networkmanager"
    	"cifs-utils"
    	"xorg"
	"sddm"
	"ttf-droid"
	"curl"
	"ttf-dejavu"
    	"ttf-liberation"
   	"ttf-ubuntu-font-family"
    	"noto-fonts"
    	"noto-fonts-cjk"
    	"noto-fonts-emoji"
	"noto-fonts-extra"
    	"ttf-opensans"
    	"ttf-jetbrains-mono-nerd"
	"ttf-hack"
	"git"
	"thunar"
	"kitty"
	"hyprlock"
	"hyprland"
	"waybar"
	"firefox"
	"rofi"
	"telegram-desktop"
	"nerd-fonts-complete"
)


if [[ $EUID -ne 0 ]]; then
	echo "Script need to run as a root. Use Sudo"
    exit 1
fi

pacman -Sy

for pkg in "${PACKAGES[@]}"; do
    if pacman -Si "$pkg" &>/dev/null; then
        echo "Syncing: $pkg"
        pacman -S --noconfirm --needed "$pkg"
    else
        echo "$pkg not avaible, check for pacman.d file"
    fi
done

fc-cache -fv

echo "Here we go again"
