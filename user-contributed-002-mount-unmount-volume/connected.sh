#!/bin/sh

#  connected.sh
#  
#  Created for use with Tunnelblick VPN Client
#  This script is to Auto-Mount a network drive (afp)
#  upon successful connection to a VPN Connection
#
#  Use this script at your own risk.
#  
#
#  Instructions:
#
#  Change Below <USERNAME> <NAME> <AFPUSER> <SERVER> <FOLDER>
#
#  <USERNAME> - You local user name on client computer
#  <NAME> - Name you will use as your volume name (can be anything you want)
#  <AFPUSER> - Username that your server needs to login
#  <SERVER> - This can be a NAMESERVER ex.(NetworkServer1) or an IP Address ex. (192.0.0.0)
#  <FOLDER> - Specific folder on the server you want to connect to (optional)
#
#  Example: If you are going to change <USERNAME> it will look like this: su john01 -c
#           If you want to change <AFPUSER>@<SERVER>/<FOLDER> it will look like this:
#           afp://afpuser1@192.168.0.0/Documents
#
#
#  If you want the volume to open after it has been mounted then remove the hash mark before
#  open /Volumes/<NAME> and replace <NAME> to match the DIR <NAME> you created in mkdir
#
#
#  This is a very basic script but this is for people that do not want to trial and error
#  with auto mounting dirves and this was created specifically for Tunnelblick.
#
#
#  Place both connected.sh and post-disconnect.sh in your Tunnelblick .tblk folder you created
#  with your connection configuration files/keys, then load the .tblk file as Tunnelblick 
#  advises you.
#
#  Created by John <tHesR5> Griffis on 9/9/11.
#  

su <USERNAME> -c '
mkdir /Volumes/<NAME>
mount_afp afp://<AFPUSER>@<SERVER>/<FOLDER> /Volumes/<NAME>
'

# open /Volumes/<NAME>
