#!/bin/sh # 
 # # Command: wget https://raw.githubusercontent.com/emilnabil/channel-emil-nabil/main/installer.sh -qO - | /bin/sh # # ########################################### ###########################################  
MY_URL=https://raw.githubusercontent.com/emilnabil/channel-emil-nabil/main/  
echo "******************************************************************************************************************"
echo "    download and install channel  "
echo "============================================================================================================================="
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
echo "Installing astra sm patch"
opkg install astra-sm 
opkg install dvbsnoop
sleep 1
wget -O /etc/astra/scripts/abertis "https://drive.google.com/uc?id=1B0k60UTtmrHgQTrRkI6SFR3TenCZO_eL&export=download"
chmod 755 /etc/astra/scripts/abertis
sleep 1
wget -O /etc/astra/astra.conf "https://drive.google.com/uc?id=1B16pdta4o2u_PChUAG1hEAWKj1So2vCh&export=download"
chmod 755 /etc/astra/astra.conf
sleep 1
echo ""
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
init 6
exit 0

