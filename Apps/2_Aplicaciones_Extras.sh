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

############################
##     IMPORTACIONES      ##
############################
source "$WORKSCRIPT/Apps/bashit.sh"
source "$WORKSCRIPT/Apps/OhMyZsh.sh"
source "$WORKSCRIPT/Apps/vim.sh"

###########################
##       FUNCIONES       ##
###########################
aplicaciones_extras() {
    echo -e "$VE Instalando Aplicaciones$RO Extras$CL"
    bashit_Instalador
    ohmyzsh_Instalador
    vim_Instalador
}
