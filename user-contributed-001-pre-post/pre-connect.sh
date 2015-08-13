#!/bin/bash
# unload Cisco extension
if [ -n "`kextstat -b com.cisco.cscotun | tail -n +2`" ]; then
  exec kextunload -b com.cisco.cscotun
fi
