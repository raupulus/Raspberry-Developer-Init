# Raspberry-Developer-Init
Mis scripts para inicializar Raspbian y sincronizar personalización entre distintas raspberrys.

Con este script consigo automatizar la instalación y configuración de software, servidores, lenguajes de programación, editores... todo según mis gustos y necesidades.

## Versión 0.0.3
Versión usable con errores parcheados y basado en el desarrollo de esta misma
suite para Debian stable que desarrollo aquí:
https://github.com/fryntiz/Debian_Developer_Init

Si encuentras algún fallo o detectas que algo podría funcionar mejor, añade un **Issue** al que estaré encantado de atender y valorar.

También puedes colaborar con los PR que creas oportuno siempre que vaya en la línea del script y no sea necesario darle la vuelta a todo el proyecto.

En todo caso recomiendo usar la rama **Master** y si quieres colaborar crea un **fork** y haz **PR** sobre la rama **dev**

## Compatibilidad
Todo el script está pensado y basado para Raspbian estable y se continuará actualizando a la par que este.

Muchas configuraciones quedarán realmente dentro del repositorio y en el lugar correspondiente se generará un enlace hacia el recurso, permitiendo actualizar el repositorio y tener nuevas configuraciones.

## Advertencias
Si no usas **repositorios oficiales** o usas repositorios mezclados con los oficiales usar este script es un **experimento** ya que no lo he probado ni tengo interés en ello. Podría funcionar bien (o no) así que úsalo bajo tu riesgo.

Este script está automatizado y puede cambiar configuración sin que te pregunte.

Una buena idea sería que lo ejecutaras tras hacer una copia de seguridad o en una máquina virtual hasta ver que el script completo se adapta a tus necesidades o modificar la parte que prefieras diferente. Trabajo en la modularidad para que puedas ejecutar solo una parte que te interese.

Para evitar que sea interactivo y estar constantemente preguntando se establece "-y" como parámetro por defecto en **apt** lo cual puede instalar software en forma de dependencia y/o romper en casos muy extremos el sistema, aunque repito que con repositorios oficiales no debe ocurrir nada extraño y si es así puedes reportarlo para su corrección.

En **ningún caso** me hago responsable de pérdidas de datos con el uso de esta herramienta ya que se ha diseñado en función a mis necesidades y la comparto para que puedas aprovechar parte o por completo la misma (Respetando la licencia GPLv3 que le he asignado).

## Ejecutar script
Es importante realizar todos los pasos desde bash. Si usas **zsh** cambia a **bash** antes de ejecutarlo:
```bash
    bash
```

Primero instalamos GIT
```debian
    sudo apt install git
```

Clonamos el repositorio actual en nuestro equipo
```GIT
    git clone https://github.com/fryntiz/Raspberry-Developer-Init.git
```

Entramos y ejecutamos el script principal
```bash
    cd preparar_entorno
    ./main.sh
```
