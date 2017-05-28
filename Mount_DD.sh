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
sudo service nfs-common start
sudo service nfs-kernel-server start
sudo service transmission-daemon start
echo "Done"
}


MountDD
ServiceStart
df -h
echo "Listando Directorios..."
ls /media/ManuelDD


exit 0
