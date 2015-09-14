#!/bin/bash -
#===============================================================================
#
#          FILE: set.port.sh
#
#         USAGE: ./set.port.sh
#
#   DESCRIPTION:
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: ORiON
#  ORGANIZATION:
#       CREATED: 04/23/2015 17:29
#      REVISION: 1.0
#===============================================================================

set -o nounset                              # Treat unset variables as an error

SETTINGS_PATH=/home/steam/.klei/DoNotStarveTogether/settings.ini

port="${1}"

if [ ! -z $port ]
then
	sed -i "s/\(port = \).*/\1${port}/" "$SETTINGS_PATH"
	echo "port updated."
fi
