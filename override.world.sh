#!/bin/bash -
#===============================================================================
#
#          FILE: override.world.sh
#
#         USAGE: ./override.world.sh
#
#   DESCRIPTION:
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: ORiON
#  ORGANIZATION:
#       CREATED: 05/24/2015 16:06
#      REVISION: 1.0
#===============================================================================

set -o nounset                              # Treat unset variables as an error

WORLD_GEN_OVERRIDE_PATH=/home/steam/.klei/DoNotStarveTogether/worldgenoverride.lua

for p in "$@"
do
	key=$(echo "$p" | cut -d '=' -f1)
	val=$(echo "$p" | cut -d '=' -f2)
	sed -i "/${key}/s/\".*\"/\"${val}\"/" "${WORLD_GEN_OVERRIDE_PATH}"
done

