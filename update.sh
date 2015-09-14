#!/bin/bash -
#===============================================================================
#
#          FILE: update.sh
#
#         USAGE: ./update.sh
#
#   DESCRIPTION:
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: ORiON
#  ORGANIZATION:
#       CREATED: 04/02/2015 19:32
#      REVISION: 1.0
#===============================================================================

set -o nounset                              # Treat unset variables as an error

cd ${STEAM_CMD}

./steamcmd.sh +@ShutdownOnFailedCommand 1 +@NoPromptForPassword 1 +login anonymous +force_install_dir /home/steam/steamapps/DST +app_update 343050 validate +quit

cp ~/dedicated_server_mods_setup.lua /home/steam/steamapps/DST/mods/
