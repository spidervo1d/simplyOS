#!/usr/bin/env bash
set -euo pipefail

WORKDIR="$(mktemp -d)"
trap 'rm -rf "$WORKDIR"' EXIT

cd "$WORKDIR"

git clone https://github.com/project-repo/cagebreak.git
cd cagebreak

git checkout 0d9d8ea34a6dc2f21c5c6176f3e0cf29887e2a88   # o el commit correspondiente

meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dxwayland=true

meson compile -C build
meson install -C build
