#!/usr/bin/env bash
set -euo pipefail

WORKDIR="$(mktemp -d)"
trap 'rm -rf "$WORKDIR"' EXIT

cp -a /tmp/files/third_party/cagebreak "$WORKDIR/"

cd "$WORKDIR/cagebreak"

meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dxwayland=true

meson compile -C build

DESTDIR=/ meson install -C build
