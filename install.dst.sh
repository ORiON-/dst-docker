#!/bin/bash - 
#===============================================================================
#
#          FILE: install.dst.sh
# 
#         USAGE: ./install.dst.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: ORiON
#  ORGANIZATION: 
#       CREATED: 03/27/2015 14:06
#      REVISION: 1.0
#===============================================================================

set -o nounset                              # Treat unset variables as an error

mkdir ~/steamcmd 
cd ~/steamcmd/ 
wget -q http://media.steampowered.com/installer/steamcmd_linux.tar.gz 
tar -zxf steamcmd_linux.tar.gz

./steamcmd.sh +@ShutdownOnFailedCommand 1 +@NoPromptForPassword 1 +login anonymous +force_install_dir /home/steam/steamapps/DST +app_update 343050 validate +quit

cp ~/{dedicated_server_mods_setup.lua,modsettings.lua} ~/steamapps/DST/mods/
#cp ~/settings.ini ~/.klei/DoNotStarveTogether/
