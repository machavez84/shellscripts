#!/bin/bash
#Script para iniciar servicios que utilizan DD Externo


#Iniciar servicios que utilizan DD
ServicesStart ()
{
echo "Reiniciando servicios dependientes..."
sudo service nfs-common start
sudo service nfs-kernel-server start
sudo service transmission-daemon start
echo "Done"
}


ServicesStart


exit 0
