#!/usr/bin/env bash
# -*- ENCODING: UTF-8 -*-
##
## @author     Raúl Caro Pastorino
## @copyright  Copyright © 2018 Raúl Caro Pastorino
## @license    https://wwww.gnu.org/licenses/gpl.txt
## @email      tecnico@fryntiz.es
## @web        www.fryntiz.es
## @github     https://github.com/fryntiz
## @gitlab     https://gitlab.com/fryntiz
## @twitter    https://twitter.com/fryntiz
##
##             Guía de estilos aplicada:
## @style      https://github.com/fryntiz/Bash_Style_Guide

############################
##     INSTRUCCIONES      ##
############################
## Este script realiza cada un tiempo una comprobación a la ip indicada al
## iniciar el script para anotar la última vez que estuvo disponible esa IP

############################
##     IMPORTACIONES      ##
############################

############################
##       CONSTANTES       ##
############################
AM="\033[1;33m"  ## Color Amarillo
AZ="\033[1;34m"  ## Color Azul
BL="\033[1;37m"  ## Color Blanco
CY="\033[1;36m"  ## Color Cyan
GR="\033[0;37m"  ## Color Gris
MA="\033[1;35m"  ## Color Magenta
RO="\033[1;31m"  ## Color Rojo
VE="\033[1;32m"  ## Color Verde
CL="\e[0m"       ## Limpiar colores

VERSION="0.0.1"
WORKSCRIPT=$PWD  ## Directorio principal del script
USER=$(whoami)   ## Usuario que ejecuta el script

###########################
##       VARIABLES       ##
###########################

###########################
##       FUNCIONES       ##
###########################
##
## Recibe una dirección y un tiempo en segundos para vigilarla
## $1 String  Dirección a vigilar
## $2 Numeric Tiempo en segundos cada cuanto vigila la dirección anterior
##
comprobarIP() {
    local IP=$1     ## Host a vigilar
    local time=$2   ## Tiempo para reintentar en segundos

    while true; do
        echo -e "$AZ Comprobando dirección:$AM $1$CL"
        ping -c1 $IP
        local res=$?

        ## Cuando el ping devuelve 0 se ha realizado correctamente
        if [[ $res -eq 0 ]]; then
            echo -e "$VE El ping es correcto$CL"
            date > 'pingPI0.txt'
        else
            echo -e "$RO El ping ha sido incorrecto$CL"
        fi

        sleep $time
        clear
    done
    exit 0
}

###########################
##       EJECUCIÓN       ##
###########################
## Inicia la comprobación hacia el host: localhost
comprobarIP localhost 300

exit 0
