#!/bin/bash
#Script para montar ISO en /media/ISO

#Montar ISO
MountISO ()
{
echo "Montando DD..."
sudo mount $ISO /media/ISO 
echo "Done"
}


#Reiniciar servicios que utilizan DD
ServiceRestart ()
{
echo "Reiniciando servicios dependientes..."
sudo service nfs-common restart
sudo service nfs-kernel-server restart
sudo service transmission-daemon restart
echo "Done"
}

echo "Indice la ruta del ISO"
read ISO
MountISO
ServiceRestart
df -h
echo "Listando Directorios..."
ls /media/ISO


exit 0
