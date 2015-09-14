#!/bin/bash - 
#===============================================================================
#
#          FILE: build.sh
# 
#         USAGE: ./build.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: ORiON
#  ORGANIZATION: 
#       CREATED: 03/27/2015 14:18
#      REVISION: 1.1
#===============================================================================

set -o nounset                              # Treat unset variables as an error

docker build -t orion1337/dst:latest --no-cache=true --rm=true .
