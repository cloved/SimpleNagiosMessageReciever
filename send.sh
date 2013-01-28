#!/bin/bash - 
#===============================================================================
#
#          FILE: send.sh
# 
#         USAGE: ./send.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: cloved (石头, Rock Chen -- chnl@163.com), cloved@gmail.com
#  ORGANIZATION: itnms.info
#       CREATED: 01/23/2013 06:33:55 PM CST
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
nagios_server_url="http://127.0.0.1/cgi-bin/snmr"

#wget -O - -S  "${nagios_server_url}"'?service=network_monitor&severity=2&msg=Ping_220.171_and_220.166_error_network_had_been_restarted_2_mins_ago|time=0s;;;;&host=c167'
curl -D -  "${nagios_server_url}"'?service=network_monitor&severity=2&msg=Ping_220.171_and_220.166_error_network_had_been_restarted_2_mins_ago&host=c167'
