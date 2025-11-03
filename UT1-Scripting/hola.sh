#!/bin/bash

if [ $# -eq 0 ]
then
    echo "No se ha recibido parametros"
    exit 1
else
    Nombre=$1
    echo "Hola $Nombre"
fi
