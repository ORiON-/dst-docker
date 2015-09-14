#!/bin/bash -
#===============================================================================
#
#          FILE: set.modes.sh
#
#         USAGE: ./set.modes.sh
#
#   DESCRIPTION:
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: ORiON
#  ORGANIZATION:
#       CREATED: 04/22/2015 06:57
#      REVISION: 1.0
#===============================================================================

set -o nounset                              # Treat unset variables as an error

MODS_OVERRIDE_PATH="$HOME"/.klei/DoNotStarveTogether/modoverrides.lua
DEDICATED_SERVER_MODS_SETUP_PATH="$STEAM_APPS"/DST/mods/dedicated_server_mods_setup.lua

echo -n "" > "${MODS_OVERRIDE_PATH}"
echo -n "" > "$DEDICATED_SERVER_MODS_SETUP_PATH"

echo "return {" >> "${MODS_OVERRIDE_PATH}"
for mod in "$@"
do
	echo -e "\t[\"workshop-${mod}\"] = { enabled = true }," >> "${MODS_OVERRIDE_PATH}"
	echo "ServerModSetup($mod)" >> "$DEDICATED_SERVER_MODS_SETUP_PATH"
done
echo "}" >> "${MODS_OVERRIDE_PATH}"

cat "${MODS_OVERRIDE_PATH}"
cat "$DEDICATED_SERVER_MODS_SETUP_PATH"
