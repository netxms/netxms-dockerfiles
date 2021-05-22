#!/bin/bash

# https://wiki.netxms.org/wiki/Agent_Configuration_File

nxagent_conf=/data/nxagent.conf
nxagent_log_file=/data/nxagent.log

if [ ! -f "${nxagent_conf}" ];
then
    echo "Generating NetXMS Agent config file ${nxagent_conf}"
    cat > ${nxagent_conf} <<EOL
# https://wiki.netxms.org/wiki/Agent_Configuration_File

LogFile = ${nxagent_log_file}

${NETXMSD_CONFIG}
EOL
fi


# Usage: nxagentd [options]
# Where valid options are:
#   -c <file>  : Use configuration file <file> (default {search})
#   -C         : Load configuration file, dump resulting configuration, and exit
#   -d         : Run as daemon/service
#   -D <level> : Set debug level (0..9)
#   -f         : Run in foreground
#   -g <gid>   : Change group ID to <gid> after start
#   -G <name>  : Use alternate global section <name> in configuration file
#   -h         : Display help and exit
#   -K         : Shutdown all connected external sub-agents
#   -M <addr>  : Download config from management server <addr>
#   -p         : Path to pid file (default: /var/run/nxagentd.pid)
#   -P <text>  : Set platform suffix to <text>
#   -r <addr>  : Register agent on management server <addr>
#   -u <uid>   : Chhange user ID to <uid> after start
#   -v         : Display version and exit


ARGS="-f"
[ -n "$NXAGENT_REGISTERSERVER" ] && ARGS="$ARGS -r $NXAGENT_REGISTERSERVER"
[ -n "$NXAGENT_CONFIGSERVER" ] && ARGS="$ARGS -M $NXAGENT_CONFIGSERVER"
[ -n "$NXAGENT_LOGLEVEL" ] && ARGS="$ARGS -D $NXAGENT_LOGLEVEL"
[ -n "$NXAGENT_PLATFORMSUFFIX" ] && ARGS="$ARGS -P $NXAGENT_PLATFORMSUFFIX"

echo "Starting nxagentd"
exec nxagentd $ARGS -c "${nxagent_conf}" 