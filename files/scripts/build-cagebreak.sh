#!/usr/bin/env bash
set -euo pipefail

cd /usr/src/third_party/cagebreak

meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dxwayland=true

meson compile -C build

DESTDIR=/ meson install -C build
