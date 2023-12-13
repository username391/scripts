#!/bin/bash

echo "Configuring TouchPad"
echo 'Section "InputClass"
        Identifier "libinput touchpad catchall"
        MatchIsTouchpad "on"
        MatchDevicePath "/dev/input/event*"
        Driver "libinput"
	Option "NaturalScrolling" "on"
	Option "ClickMethod" "clickfinger"
	Option "Tapping" "on"
EndSection' > /etc/X11/xorg.conf.d/30-touchpad.conf
