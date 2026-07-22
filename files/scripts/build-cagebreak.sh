#!/usr/bin/env bash
set -euo pipefail

# Crear directorio temporal y asegurar limpieza al terminar
workdir="$(mktemp -d)"
trap 'rm -rf "$workdir"' EXIT

cd "$workdir"

# Clonar repositorio oficial de Cagebreak
git clone --depth 1 https://github.com/project-repo/cagebreak.git
cd cagebreak

# Compilar con Meson/Ninja (Habilitar XWayland)
PKG_CONFIG_PATH=/usr/lib64/pkgconfig:/usr/share/pkgconfig \
meson setup build \
    -Dxwayland=true \
    --buildtype=release

ninja -C build
meson install -C build

# Volver a raíz y limpiar (aunque el trap ya lo hará)
cd /
rm -rf "$workdir"

