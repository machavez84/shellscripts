#!/bin/bash
#Script para desmontar ISO de /media/ISO

#Detener servicios que utilizan el DD
ServiceStop ()
{
echo "Deteniendo servicios dependientes..."
sudo service nfs-common stop
sudo service nfs-kernel-server stop
echo "Done"
}

#Desmontar ISO
UmountISO ()
{
echo "desmontando DD..."
sudo umount /media/ISO
echo "Done"
}

ServiceStart ()
{
echo "Reiniciando servicios dependientes..."
sudo service nfs-common start
sudo service nfs-kernel-server start
sudo service transmission-daemon start
echo "Done"
}

ServiceStop
UmountISO
ServiceRestart
df -h
echo "Listando Directorios..."
ls /media/ISO

exit 0
