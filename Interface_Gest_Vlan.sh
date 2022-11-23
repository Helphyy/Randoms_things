#!/bin/bash

#Status = setup ou delete en fonction de l'utilisation du script
STATUS=$1

help(){
echo "
=====Script Auto_Lab=====

### Green IT Solutions ###

10/08/2022 : V2

### Ce script permet de pauser un ID_VLAN et une IP sur une interface ###

=========Options=========

- --setup

- --delete

=========================
"
}

start() {
    echo "=============================="
	echo "  choix interface interfaces  "
	echo "=============================="
    cd /sys/class/net && select DEV in *; do break; done
    echo "========================="
	echo "  choix de l'ID du Vlan  "
	echo "========================="
    read ID_vlan
    echo "==============================="
	echo "  choix de l'IP de L'interface "
    echo "   Exemple : 192.168.1.x/24    "
	echo "==============================="
    read IP_VLAN
    echo "===================="
	echo "  Setup interfaces  "
	echo "===================="
    ip link add link $DEV name $DEV.$ID_vlan type vlan id $ID_vlan
    ip link set dev $DEV.$ID_vlan up
    ip address add $IP_VLAN dev $DEV.$ID_vlan
    echo "================"
	echo "    Setup OK    "
	echo "================"
}

remove(){
    echo "=============================="
	echo "  choix interface interfaces  "
	echo "=============================="
    cd /sys/class/net && select DEV in *; do break; done
	echo "=============================="
	echo "  Suppression des interfaces  "
	echo "=============================="
    ip link set dev $DEV down
    ip link delete $DEV
	echo "========================="
	echo "  Fin de la suppression  "
	echo "========================="
}

# Option part

#si option --start_lab
if [ "$STATUS" == "--setup" ];then
	start

# si option --end_lab
elif [ "$STATUS" == "--delete" ];then
	remove

# si pas d'option
else
	help
fi