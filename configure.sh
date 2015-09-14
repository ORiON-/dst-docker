#!/bin/bash -
#===============================================================================
#
#          FILE: configure.sh
#
#         USAGE: ./configure.sh
#
#   DESCRIPTION:
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: ORiON
#  ORGANIZATION:
#       CREATED: 03/27/2015 19:45
#      REVISION: 1.2
#===============================================================================

set -o nounset

SETTINGS_PATH=/home/steam/.klei/DoNotStarveTogether/settings.ini

if [ $# -eq 0 ]
then
	echo -e "You can press enter to skip fields."
	echo -e "At the first time you must supply server token \n\n"

	echo "Enter server token"
	read serverToken

	echo "Enter server name"
	read serverName

	echo "Enter server description"
	read serverDesc

	echo "Enter game mode (endless/survival/wilderness)"
	read serverGameMode

	echo "Enter PvP mode (true/false)"
	read serverPvP

	echo "Enter max players"
	read serverMaxPlayers

	echo "Enter save slot"
	read serverSaveSlot

	echo "Enter password, press enter for no password"
	read serverPassword
else
	serverToken="$1"
	serverName="$2"
	serverDesc="$3"
	serverGameMode="$4"
	serverPvP="$5"
	serverMaxPlayers="$6"
	serverSaveSlot="$7"
	serverPassword="$8"
fi

echo ""
echo "============================="
echo "Updating settings.ini content"
echo "============================="
echo ""

if [ ! -z "${serverToken}" ]
then
	sed -i "s/\(server_token = \).*/\1${serverToken//\//\\\/}/" "$SETTINGS_PATH"
	echo "Server token updated."
fi

if [ ! -z "${serverName}" ]
then
	sed -i "s/\(default_server_name = \).*/\1${serverName}/" "$SETTINGS_PATH"
	echo "Server name updated."
fi

if [ ! -z "${serverDesc}" ]
then
	sed -i "s/\(default_server_description = \).*/\1${serverDesc}/" "$SETTINGS_PATH"
	echo "Server description updated."
fi

if [ ! -z "${serverGameMode}" ]
then
	sed -i "s/\(game_mode = \).*/\1${serverGameMode}/" "$SETTINGS_PATH"
	echo "Server game mode updated."
fi

if [ ! -z "${serverPvP}" ]
then
	sed -i "s/\(pvp = \).*/\1${serverPvP}/" "$SETTINGS_PATH"
	echo "Server pvp mode updated."
fi

if [ ! -z "${serverMaxPlayers}" ]
then
	sed -i "s/\(max_players = \).*/\1${serverMaxPlayers}/" "$SETTINGS_PATH"
	echo "Server max players updated."
fi

if [ ! -z "${serverSaveSlot}" ]
then
	sed -i "s/\(server_save_slot = \).*/\1${serverSaveSlot}/" "$SETTINGS_PATH"
	echo "Server save slot updated."
fi

sed -i "s/\(server_password = \).*/\1${serverPassword}/" "$SETTINGS_PATH"
echo "Server password updated."

echo ""
echo "========================"
echo "New settings.ini content"
echo "========================"
echo ""

cat "$SETTINGS_PATH"
