#!/bin/bash 
function show_keys { 
	echo "No keys set"
	echo "Supported keys:"
	echo "--all key displays the IP addresses and symbolic names of all hosts in the current"
	echo "--target key displays a list of open system TCP ports"
exit 1
}
function all 
{
sudo nmap -sP $2
}

function target
{
sudo netstat -tlp
} 
if [ "$1" == "--all" ]; then all 
elif [ "$1" == "--target" ]; then target
elif  [ -z $* ]; then show_keys
else echo "invalid option"
fi
