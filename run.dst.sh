#!/bin/bash -
#===============================================================================
#
#          FILE: run.dst.sh
#
#         USAGE: ./run.dst.sh
#
#   DESCRIPTION:
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: ORiON
#  ORGANIZATION:
#       CREATED: 03/27/2015 15:53
#      REVISION: 1.1
#===============================================================================

set -o nounset                              # Treat unset variables as an error

docker pull orion1337/dst:latest
docker rm -f dst
docker run --name dst -p 10999:10999/udp -d orion1337/dst:latest
