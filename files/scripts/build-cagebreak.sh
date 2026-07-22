#!/usr/bin/env bash
set -euo pipefail

workdir="$(mktemp -d)"
trap 'rm -rf "$workdir"' EXIT

cd "$workdir"
git clone --depth 1 https://github.com/project-repo/cagebreak.git
cd cagebreak

meson setup build -Dxwayland=true --buildtype=release
ninja -C build
meson install -C build

cd /
rm -rf "$workdir"
