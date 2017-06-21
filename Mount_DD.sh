#!/bin/bash
#Script para montar DD Externo

#Montar DD
MountDD ()
{
echo "Montando DD..."
sudo mount -a
echo "Done"
}


#Reiniciar servicios que utilizan DD
ServiceStart ()
{
echo "Reiniciando servicios dependientes..."
echo "Reiniciando docker containers..."
docker start transmission-daemon
docker start owncloud
echo "Done"
echo "Reiniciando nfs service..."
sudo service rpcbind start
sudo service nfs-kernel-server start
sudo showmount -e
echo "Done"
echo "Reiniciados todos los  servicios!"
}


MountDD
ServiceStart
df -h
echo "Listando Directorios..."
ls /media/ManuelDD


exit 0
