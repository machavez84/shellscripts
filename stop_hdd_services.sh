#!/bin/bash
#Script para parar servicios que utilizan DD Externo


#Parar servicios que utilizan DD
ServicesStop ()
{
echo "Reiniciando servicios dependientes..."
sudo service nfs-common stop
sudo service nfs-kernel-server stop
sudo service transmission-daemon stop
echo "Done"
}


ServicesStop


exit 0
