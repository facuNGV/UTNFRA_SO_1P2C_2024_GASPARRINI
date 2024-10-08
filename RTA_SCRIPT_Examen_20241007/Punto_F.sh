#!/bin/bash 
PATH_FILTRO_AVANZADO="/home/vagrant/repogit/UTNFRA_SO_1P2C_2024_GASPARRINI/RTA_ARCHIVOS_Examen_20241007/Filtro_Avanzado.txt"
PATH_MI_REPO="/home/vagrant/repogit/UTNFRA_SO_1P2C_2024_GASPARRINI"

# Obtener la IP pública, el usuario, y el hash del usuario
ME_IP=$(curl -s ifconfig.me)
ME_USER=$(whoami)
HASH_MI_USER=$(echo -n "$ME_USER" | sha256sum | awk '{print $1}')
cd $PATH_MI_REPO
URL_REPO_REMOTO=$(git remote get-url origin)
cd /home/vagrant

# Guardar los datos en el archivo Filtro_Avanzado.txt
cat << EOF > $PATH_FILTRO_AVANZADO
Mi IP Pública es: $ME_IP
Mi usuario es: $ME_USER
El hash de mi usuario es: $HASH_MI_USER
La URL de mi repositorio es: $URL_REPO_REMOTO
EOF
echo "---------------------------------------------------------------------------------------------------------------------------"
echo "Guardando informacion en Filtro_Avanzado.txt..."
echo "---------------------------------------------------------------------------------------------------------------------------"
echo "Información de Filtro Avanzado: "
echo " "
cat $PATH_FILTRO_AVANZADO
