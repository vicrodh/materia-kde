#!/bin/sh

set -e

gh_desc="Materia KDE"

_msg() {
    echo "=>" "$@" >&2
}

_rm() {
    # elimina directorios padres si están vacíos
    sudo rm -rf "$1"
    sudo rmdir -p "$(dirname "$1")" 2>/dev/null || true
}

_msg "Eliminando $gh_desc y todos sus complementos ..."
_rm "/usr/share/aurorae/themes/Materia"
_rm "/usr/share/aurorae/themes/Materia-Dark"
_rm "/usr/share/aurorae/themes/Materia-Light"
_rm "/usr/share/color-schemes/MateriaDark.colors"
_rm "/usr/share/color-schemes/MateriaLight.colors"
_rm "/usr/share/konsole/Materia.colorscheme"
_rm "/usr/share/konsole/MateriaDark.colorscheme"
_rm "/usr/share/Kvantum/Materia"
_rm "/usr/share/Kvantum/MateriaDark"
_rm "/usr/share/Kvantum/MateriaLight"
_rm "/usr/share/plasma/desktoptheme/Materia"
_rm "/usr/share/plasma/desktoptheme/Materia-Color"
_rm "/usr/share/plasma/look-and-feel/com.github.varlesh.materia"
_rm "/usr/share/plasma/look-and-feel/com.github.varlesh.materia-dark"
_rm "/usr/share/plasma/look-and-feel/com.github.varlesh.materia-light"
_rm "/usr/share/yakuake/skins/materia-dark"
_rm "/usr/share/yakuake/skins/materia-light"
_rm "/usr/share/wallpapers/Materia"
_rm "/usr/share/wallpapers/Materia-Dark"
_rm "/usr/share/sddm/themes/materia"
_rm "/usr/share/sddm/themes/materia-dark"
_rm "/usr/share/sddm/themes/materia-light"

_msg "Limpiando caché de Plasma ..."
rm -rf ~/.cache/plasma-svgelements-Materia* ~/.cache/plasma_theme_Materia*.kcache

_msg "¡Desinstalación completa!"
