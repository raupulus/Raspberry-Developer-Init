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
mostrarTemperatura() {
    cpu=$(cat /sys/class/thermal/thermal_zone0/temp)
    echo -e "$VE$(date) @ $(hostname)$CL"
    echo -e "$RO -------------------------------------------$CL"
    echo -e "$VE Temp.CPU ->$RO $((cpu/1000))' ºC$CL"
    echo -e "$VE Temp.GPU ->$RO $(/opt/vc/bin/vcgencmd measure_temp) ºC$CL"
    echo -e "$RO -------------------------------------------$CL"
}

###########################
##       EJECUCIÓN       ##
###########################
mostrarTemperatura

exit 0
