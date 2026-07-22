#!/usr/bin/env bash
set -xeuo pipefail

echo "===== INICIO ====="

git clone https://github.com/project-repo/cagebreak.git
cd cagebreak

git checkout 0d9d8ea34a6dc2f21c5c6176f3e0cf29887e2a88

meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dxwayland=true

meson compile -C build --verbose

DESTDIR=/ meson install -C build

echo "===== FIN ====="
