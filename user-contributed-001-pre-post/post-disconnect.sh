#!/bin/bash
# reload Cisco extension
echo "Reloading Cisco VPN Tunnel kernel extension..."
exec kextload /System/Library/Extensions/tun.kext
