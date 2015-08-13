#!/bin/sh

#  post-disconnect.sh
#  
#  Created to be used specifically with connected.sh for Tunnelblick.
#
#  Change the below <NAME> to the same name you created in connected.sh for
#  mkdir /Volumes/<NAME>
#
#  Created by John Griffis on 9/9/11.
#  


umount -f /Volumes/<NAME>
