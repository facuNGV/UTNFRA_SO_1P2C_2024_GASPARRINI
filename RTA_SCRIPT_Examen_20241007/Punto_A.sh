#!/bin/bash
echo "---------------------------------------------------------------------------------------------------------"
echo "Añadiendo directorios de Examenes-UTN"
echo "---------------------------------------------------------------------------------------------------------"
sudo mkdir -p /Examenes-UTN/{alumno_1/parcial_{1..3},alumno_2/parcial_{1..3},alumno_3/parcial_{1..3},profesores}
echo "Directorios añadidos: "
echo " "
tree /Examenes-UTN
echo "---------------------------------------------------------------------------------------------------------"
