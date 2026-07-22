#!/usr/bin/env bash
set -euo pipefail

workdir="$(mktemp -d)"
trap 'rm -rf "$workdir"' EXIT

cd "$workdir"
git clone --depth 1 https://github.com/project-repo/cagebreak.git
cd cagebreak

meson setup build -Dxwayland=true -Dman-pages=false --buildtype=release
ninja -C build
meson install -C build
