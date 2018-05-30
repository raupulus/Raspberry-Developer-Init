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
## @twitter    https://twitter.com/fryntiz
##
##             Guía de estilos aplicada:
## @style      https://github.com/fryntiz/Bash_Style_Guide

############################
##     INSTRUCCIONES      ##
############################

###########################
##       FUNCIONES       ##
###########################
##
## Añade llaves oficiales para cada repositorio
##
agregar_llaves() {
    echo -e "$VE Instalando llaves de repositorios$CL"

    ## Webmin
    echo -e "$VE Agregando clave para$RO Webmin$CL"
    wget http://www.webmin.com/jcameron-key.asc && sudo apt-key add jcameron-key.asc
    sudo rm jcameron-key.asc

    ## Docker
    echo -e "$VE Agregando clave para$RO Docker$CL"
    sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys F76221572C52609D

    ## Mi propio repositorio en launchpad
    echo -e "$VE Agregando clave para$RO Fryntiz Repositorio$CL"
    gpg --keyserver keyserver.ubuntu.com --recv-key B5C6D9592512B8CD && gpg -a --export $PUBKRY | sudo apt-key add -

    ## Repositorio de PostgreSQL Oficial
    echo -e "$VE Agregando clave para$RO PostgreSQL Oficial Repositorio$CL"
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

    ## Repositorio de NodeJS Oficial
    #echo -e "$VE Agregando clave para$RO NodeJS Oficial Repositorio$CL"
    #curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash -
}

##
## Crea Backups de repositorios y añade nuevas listas
##
sources_repositorios() {
    echo -e "$VE Añadido$RO sources.list$VE y$RO sources.list.d/$VE Agregados$CL"

    if [[ ! -d '/etc/apt/sources.list.d' ]]; then
        sudo mkdir -p '/etc/apt/sources.list.d'
    fi
    sudo cp $WORKSCRIPT/sources.list/sources.list.d/* /etc/apt/sources.list.d/

    #sudo mv /etc/apt/sources.list /etc/apt/sources.list.BACKUP 2>> /dev/null
    crearBackup '/etc/apt/sources.list' '/etc/apt/sources.list.d/'

    if [[ ! -d '/etc/apt/sources.list' ]]; then
        sudo rm -f '/etc/apt/sources.list'
    fi
    sudo cp "$WORKSCRIPT/sources.list/sources.list" "/etc/apt/sources.list"
}

##
## Instala dependencias para actualizar repositorios e instalar
##
preparar_repositorios() {
    echo -e "$VE Actualizando repositorios por primera vez$CL"
    sudo apt update >> /dev/null 2>> /dev/null
    instalarSoftware apt-transport-https && echo -e "$VE Instalado el paquete$RO apt-transport-https$CL" || echo -e "$VE Error al instalar$RO apt-transport-https$CL"

    instalarSoftware dirmngr && echo -e "$VE Instalado el paquete$RO dirmngr$CL" || echo -e "$VE Error al instalar$RO dirmngr$CL"
    echo -e "$VE Agregando Repositorios$CL"

    instalarSoftware 'curl'
}

##
## Añade Repositorios extras a Debian
##
agregar_repositorios() {
    preparar_repositorios
    sources_repositorios

    echo -e "$VE Actualizando listas de$RO repositorios$VE por segunda vez$CL"
    sudo apt update

    agregar_llaves

    echo -e "$VE Actualizando listas de repositorios definitiva, comprueba que no hay$RO errores$CL"
    sudo apt update
}
