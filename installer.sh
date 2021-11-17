#!/bin/sh # 
 # # Command: wget https://raw.githubusercontent.com/emilnabil/channel-emil-nabil/main/installer.sh -qO - | /bin/sh # # ########################################### ###########################################  
MY_URL=https://raw.githubusercontent.com/emilnabil/channel-emil-nabil/main/  
echo "******************************************************************************************************************"
echo "    download and install channel  "
echo "============================================================================================================================="
echo " remove old channel "
# Remove any Channel  # 
rm -rf /etc/enigma2/lamedb 
rm -rf /etc/enigma2/*list 
rm -rf /etc/enigma2/*.tv 
rm -rf /etc/enigma2/*.radio 
rm -rf /etc/tuxbox/*.xml 
#####################################################################################
echo "         install channel    "
cd /tmp
set -e 
wget -q  "https://raw.githubusercontent.com/emilnabil/channel-emil-nabil/main/channels_backup_by_Emil-Nabil.tar.gz"
wait
tar -xzf channels_backup_by_Emil-Nabil.tar.gz  -C /
wait
cd ..
set +e
rm -f /tmp/channels_backup_by_Emil-Nabil.tar.gz
sleep 2;
echo "" 
echo "" 
echo "****************************************************************************************************************************"
echo "# Channel  INSTALLED SUCCESSFULLY #"
echo "
echo " "*********************************************************" 
	echo "********************************************************************************"
echo "   UPLOADED BY  >>>>   EMIL_NABIL "   
sleep 4;
	echo '========================================================================================================================='
###########################################                                                                                                                  
echo ". >>>>         RESTARING     <<<<"
echo "**********************************************************************************"
wait
killall -9 enigma2
exit 0















