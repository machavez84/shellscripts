#!/bin/bash
#Script para corregir error de entrada/salida en DD Externo

#Verificar DD
DDverify ()
{
echo "Verificando DD: Listando Contenido:"
ls /media/ManuelDD
if [ $? -ne 0 ]
then
    echo "Error en lectura"
    ServiceStop
    UmountDD
    MountDD
    echo "Listando Contenido..."
    ls /media/ManuelDD
    if [ $? -ne 0 ]
    	then
        echo "No se pudo montar el DD..."
        exit 1
	else
    	ServiceStart
	exit 0 
    fi
else
    echo "El Disco es accesible...Saliendo."
    exit 0
fi
}


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


DDverify


