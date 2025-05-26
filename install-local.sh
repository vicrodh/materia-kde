#!/bin/sh

set -e

gh_desc="Materia KDE"

cat <<- EOF

  ▄▄▄  ▄▄▄                                             ██
  ███  ███              ██                             ▀▀
  ████████   ▄█████▄  ███████    ▄████▄    ██▄████   ████      ▄█████▄
  ██ ██ ██   ▀ ▄▄▄██    ██      ██▄▄▄▄██   ██▀         ██      ▀ ▄▄▄██
  ██ ▀▀ ██  ▄██▀▀▀██    ██      ██▀▀▀▀▀▀   ██          ██     ▄██▀▀▀██
  ██    ██  ██▄▄▄███    ██▄▄▄   ▀██▄▄▄▄█   ██       ▄▄▄██▄▄▄  ██▄▄▄███
  ▀▀    ▀▀   ▀▀▀▀ ▀▀     ▀▀▀▀     ▀▀▀▀▀    ▀▀       ▀▀▀▀▀▀▀▀   ▀▀▀▀ ▀▀

  ▄▄   ▄▄▄  ▄▄▄▄▄     ▄▄▄▄▄▄▄▄
  ██  ██▀   ██▀▀▀██   ██▀▀▀▀▀▀
  ██▄██     ██    ██  ██
  █████     ██    ██  ███████
  ██  ██▄   ██    ██  ██
  ██   ██▄  ██▄▄▄██   ██▄▄▄▄▄▄
  ▀▀    ▀▀  ▀▀▀▀▀     ▀▀▀▀▀▀▀▀

  $gh_desc (instalación local)
  https://github.com/PapirusDevelopmentTeam/materia-kde

EOF

: "${PREFIX:=/usr}"

_msg() {
    echo "=>" "$@" >&2
}

_install() {
    _msg "Instalando desde la versión local ..."
    sudo cp -R \
        "aurorae" \
        "color-schemes" \
        "konsole" \
        "Kvantum" \
        "plasma" \
        "yakuake" \
        "wallpapers" \
        "sddm" \
        "$PREFIX/share"
}

# Ensure Look-and-Feel themes are installed in the correct directory for Plasma to detect as Global Themes
_msg "Copying Look-and-Feel themes to plasma/look-and-feel..."
sudo mkdir -p "$PREFIX/share/plasma/look-and-feel/"
sudo cp -R "plasma/look-and-feel/com.github.varlesh.materia" "$PREFIX/share/plasma/look-and-feel/"
sudo cp -R "plasma/look-and-feel/com.github.varlesh.materia-dark" "$PREFIX/share/plasma/look-and-feel/"
sudo cp -R "plasma/look-and-feel/com.github.varlesh.materia-light" "$PREFIX/share/plasma/look-and-feel/"

_cleanup() {
    _msg "Limpiando caché ..."
    rm -rf \
        ~/.cache/plasma-svgelements-Materia* \
        ~/.cache/plasma_theme_Materia*.kcache
    _msg "¡Listo!"
}

trap _cleanup EXIT HUP INT TERM

_install
