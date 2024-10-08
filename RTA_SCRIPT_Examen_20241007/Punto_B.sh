#!/bin/bash

PATH_DISCO_PARTICIONAR=$(lsblk | grep 10G | awk '{print "/dev/"$1}')
echo "Particionando discos.."
sudo fdisk $PATH_DISCO_PARTICIONAR << EOF
n
p
1
2048
+1G
n
p
2
2099200
+1G
n
p
3
4196352
+1G
n
e
6293504
20971519
+7G
n
6295552
+1G
n
8394752
+1G
n
10493952
+1G
n
12593152
+1G
n
14692352
+1G
n
16791552
+1G
w
EOF
echo "------------------------------------------------------------------------------------------------------------------------------------"
echo "Mostrar particionamientos"
echo "------------------------------------------------------------------------------------------------------------------------------------"
sudo fdisk $PATH_DISCO_PARTICIONAR -l
sudo mkfs -t ext4 ${PATH_DISCO_PARTICIONAR}1
sudo mkfs -t ext4 ${PATH_DISCO_PARTICIONAR}2
sudo mkfs -t ext4 ${PATH_DISCO_PARTICIONAR}3
sudo mkfs -t ext4 ${PATH_DISCO_PARTICIONAR}5
sudo mkfs -t ext4 ${PATH_DISCO_PARTICIONAR}6
sudo mkfs -t ext4 ${PATH_DISCO_PARTICIONAR}7
sudo mkfs -t ext4 ${PATH_DISCO_PARTICIONAR}8
sudo mkfs -t ext4 ${PATH_DISCO_PARTICIONAR}9
sudo mkfs -t ext4 ${PATH_DISCO_PARTICIONAR}10
sudo mount ${PATH_DISCO_PARTICIONAR}1 /Examenes-UTN/alumno_1/parcial_1
sudo mount ${PATH_DISCO_PARTICIONAR}2 /Examenes-UTN/alumno_1/parcial_2
sudo mount ${PATH_DISCO_PARTICIONAR}3 /Examenes-UTN/alumno_1/parcial_3
sudo mount ${PATH_DISCO_PARTICIONAR}5 /Examenes-UTN/alumno_2/parcial_2
sudo mount ${PATH_DISCO_PARTICIONAR}6 /Examenes-UTN/alumno_2/parcial_3
sudo mount ${PATH_DISCO_PARTICIONAR}7 /Examenes-UTN/alumno_3/parcial_1
sudo mount ${PATH_DISCO_PARTICIONAR}8 /Examenes-UTN/alumno_3/parcial_2
sudo mount ${PATH_DISCO_PARTICIONAR}9 /Examenes-UTN/alumno_3/parcial_3
sudo mount ${PATH_DISCO_PARTICIONAR}10 /Examenes-UTN/profesores
# Hacer montajes persistentes en /etc/fstab
echo "${PATH_DISCO_PARTICIONAR}1 /Examenes-UTN/alumno_1/parcial_1 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "${PATH_DISCO_PARTICIONAR}2 /Examenes-UTN/alumno_1/parcial_2 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "${PATH_DISCO_PARTICIONAR}3 /Examenes-UTN/alumno_1/parcial_3 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "${PATH_DISCO_PARTICIONAR}5 /Examenes-UTN/alumno_2/parcial_2 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "${PATH_DISCO_PARTICIONAR}6 /Examenes-UTN/alumno_2/parcial_3 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "${PATH_DISCO_PARTICIONAR}7 /Examenes-UTN/alumno_3/parcial_1 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "${PATH_DISCO_PARTICIONAR}8 /Examenes-UTN/alumno_3/parcial_2 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "${PATH_DISCO_PARTICIONAR}9 /Examenes-UTN/alumno_3/parcial_3 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "${PATH_DISCO_PARTICIONAR}10 /Examenes-UTN/profesores ext4 defaults 0 0" | sudo tee -a /etc/fstab
sudo mount -a
echo "------------------------------------------------------------------------------------------------------------------------------------"
echo "Montajes persistentes realizados..."
echo "------------------------------------------------------------------------------------------------------------------------------------"
df -h
