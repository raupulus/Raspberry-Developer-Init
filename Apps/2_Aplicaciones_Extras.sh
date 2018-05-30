#!/usr/bin/env bash
# -*- ENCODING: UTF-8 -*-
##
## @author     Raúl Caro Pastorino
## @copyright  Copyright © 2017 Raúl Caro Pastorino
## @license    https://wwww.gnu.org/licenses/gpl.txt
## @email      tecnico@fryntiz.es
## @web        www.fryntiz.es
## @github     https://github.com/fryntiz
## @gitlab     https://gitlab.com/fryntiz
##
##             Guía de estilos aplicada:
## @style      https://github.com/fryntiz/Bash_Style_Guide

############################
##     INSTRUCCIONES      ##
############################
## Este script enlaza la instalación de todas las aplicaciones opcionales
## que podían ser interesante instalar en uno u otro momento.

############################
##     IMPORTACIONES      ##
############################

############################
##       FUNCIONES        ##
############################

instalar_todas_aplicaciones_extras() {
    echo 'Aún no hay apps extras'
}

aplicaciones_extras() {
    echo -e "$VE Instalando Aplicaciones$RO Extras$CL"
    if [[ "$1" = '-a' ]]; then
        instalar_todas_aplicaciones_extras
    else
        while true :; do
            clear
            local descripcion='Menú de aplicaciones
                0) Atrás
            '
            opciones "$descripcion"

            echo -e "$RO"
            read -p "    Acción → " entrada
            echo -e "$CL"

            case $entrada in

                0)  ## SALIR
                    clear
                    echo -e "$RO Se sale del menú$CL"
                    echo ''
                    break;;

                *)  ## Acción ante entrada no válida
                    echo ""
                    echo -e "                      $RO ATENCIÓN: Elección no válida$CL";;
            esac
        done
    fi
}
