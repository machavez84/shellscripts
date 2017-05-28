#!/bin/bash
#Script para desmontar DD Externo

#Detener servicios que utilizan el DD
ServiceStop ()
{
echo "Deteniendo servicios dependientes..."
sudo service nfs-common stop
sudo service nfs-kernel-server stop
sudo service transmission-daemon stop
echo "Done"
}

#Desmontar DD
UmountDD ()
{
echo "desmontando DD..."
sudo umount /media/ManuelDD
echo "Done"
}

ServiceStop
UmountDD
df -h
echo "Listando Directorios..."
ls /media/ManuelDD

exit 0
