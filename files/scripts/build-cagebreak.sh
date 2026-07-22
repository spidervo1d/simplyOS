#!/usr/bin/env bash
set -euo pipefail

# Clonar y compilar Cagebreak
cd /tmp
git clone https://github.com/project-repo/cagebreak.git cagebreak
cd cagebreak
meson setup build --prefix=/usr -Dxwayland=true -Dman-pages=false
ninja -C build
ninja -C build install

