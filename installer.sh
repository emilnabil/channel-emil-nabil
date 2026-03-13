#!/bin/sh
# Command:
# wget https://raw.githubusercontent.com/emilnabil/channel-emil-nabil/main/installer.sh -qO - | /bin/sh
###########################################
MY_URL="https://raw.githubusercontent.com/emilnabil/channel-emil-nabil/main"

echo "******************************************************************************************************************"
echo "        DOWNLOAD AND INSTALL CHANNEL"
echo "=================================================================================================================="
if [ -f /etc/opkg/opkg.conf ]; then
    STATUS='/var/lib/opkg/status'
    OSTYPE='Opensource'
    OPKG='opkg update'
    OPKGINSTAL='opkg install'
fi

echo "        REMOVE OLD CHANNELS..."
rm -rf /etc/enigma2/lamedb
rm -rf /etc/enigma2/*list
rm -rf /etc/enigma2/*.tv
rm -rf /etc/enigma2/*.radio
rm -rf /etc/enigma2/epg.dat
rm -rf /etc/enigma2/timers.xml
rm -rf /home/root/.cache/enigma2

#####################################################################################
echo "        INSTALLING NEW CHANNELS..."
cd /tmp || exit 1

if wget -q "${MY_URL}/channels_backup_by_Emil-Nabil.tar.gz"; then
    if [ -s channels_backup_by_Emil-Nabil.tar.gz ]; then
        tar -xzf channels_backup_by_Emil-Nabil.tar.gz -C /
        rm -f channels_backup_by_Emil-Nabil.tar.gz
        echo "        CHANNELS INSTALLED SUCCESSFULLY"
    else
        echo "        ERROR: Downloaded file is empty"
        rm -f channels_backup_by_Emil-Nabil.tar.gz
        exit 1
    fi
else
    echo "        ERROR: Failed to download channels file"
    exit 1
fi

cd >/dev/null 2>&1 || exit 1

echo "        WAITING 5 SECONDS TO WRITE FILES..."
sleep 5

echo ""
echo "        INSTALLING ASTRA-SM PATCH"
if command -v opkg >/dev/null 2>&1; then
    opkg update >/dev/null 2>&1
    opkg install astra-sm >/dev/null 2>&1
    echo "        ASTRA-SM INSTALLED"
else
    echo "        WARNING: opkg not found, skipping astra-sm installation"
fi

sleep 1
echo ""
echo ""
echo "****************************************************************************************************************************"
echo "#       CHANNEL INSTALLED SUCCESSFULLY       #"
echo "*********************************************************"
echo "********************************************************************************"
echo "   UPLOADED BY >>>> EMIL_NABIL"
sleep 4
echo "========================================================================================================================="
echo "        INSTALLATION COMPLETE"
echo "**********************************************************************************"
echo "        Please restart Enigma2 manually to apply the changes"
echo "        You can restart by:"
echo "        - Pressing the restart button in the menu"
echo "        - Or using the command: killall -9 enigma2"
echo "**********************************************************************************"

exit 0

