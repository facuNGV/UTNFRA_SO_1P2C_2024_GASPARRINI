#!/bin/bash
PATH_E="/home/vagrant/repogit/UTNFRA_SO_1P2C_2024_GASPARRINI/RTA_ARCHIVOS_Examen_20241007/Filtro_Basico.txt"
echo "------------------------------------------------------------------------------------------------------------------"
echo "Guardando información en archivo: Filtro_Basico.txt… "
echo "------------------------------------------------------------------------------------------------------------------"
echo "Informacion guardada: "
echo " "
# Guardar Total de RAM
cat /proc/meminfo | head -n1 >> $PATH_E
# Guardar información del fabricante del chassis
sudo dmidecode -t chassis | grep -E 'Chassis Information|Manufacturer' >> $PATH_E
cat $PATH_E
echo "------------------------------------------------------------------------------------------------------------------"
