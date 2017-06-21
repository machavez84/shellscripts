#!/bin/bash
#Script para desmontar DD Externo

#Detener servicios que utilizan el DD
ServiceStop ()
{
echo "Deteniendo servicios dependientes..."
echo "Deteniendo docker containers..."
docker stop transmission-daemon
docker stop owncloud
echo "Done"
echo "Deteniendo nfs services" 
sudo service nfs-kernel-server stop
sudo service rpcbind stop
echo "Done"
echo "Todos los servicios detenidos!"
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
