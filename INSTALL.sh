\# Where do files go
if [ $1 = "x201t" ]; then
    # Fix wacom stylus buttons
    cp /usr/share/X11/xorg.conf.d/70-wacom.conf /usr/share/X11/xorg.conf.d/70-wacom.conf.x2xxt.bak
    cat files/x2xxTablet-70-wacom.conf >> /usr/share/X11/xorg.conf.d/70-wacom.conf

    # Add ACPI events
    cp files/thinkpad-tabket-* /etc/acpi/events/
    cp files/thinkpad-touchpad-twist-mode.sh
    systemctl restart acpid.service

    # Enable bezel buttons between restarts
    cp files/thinkpadtabletkeys.service /etc/systemd/system/
    systemctl enable thinkpadtabletkeys.service
    
    echo "Please restart the session by loggin out or rebooting"
elif [ $1 = "x230t" ]; then

elif [ $1 = "uninstall" ]; then
    cp /usr/share/X11/xorg.conf.d/70-wacom.conf /usr/share/X11/xorg.conf.d/70-wacom.conf.bak
    mv /usr/share/X11/xorg.conf.d/70-wacom.conf.x2xxt.bak /usr/share/X11.xorg.conf.d/70-wacom.conf
fi
