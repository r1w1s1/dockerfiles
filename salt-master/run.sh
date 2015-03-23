#!/bin/bash

#
# Salt-Master / Minion Run Script
#

set -e

# Log Level
LOG_LEVEL=${LOG_LEVEL:-"error"}

# Run Salt as a Deamon
#exec /usr/bin/salt-master --log-level=$LOG_LEVEL
exec /usr/bin/salt-master -d 

# Run Salt Minion
exec /usr/bin/salt-minion -d
