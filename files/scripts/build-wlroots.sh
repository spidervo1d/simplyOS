#!/usr/bin/env bash
set -euo pipefail

workdir="$(mktemp -d)"
trap 'rm -rf "$workdir"' EXIT

cd "$workdir"
git clone https://github.com/swaywm/wlroots.git
cd wlroots

tag="$(git tag -l '*0.20*' | sort -V | tail -n1)"
git checkout "$tag"

meson setup build -Dxwayland=true --buildtype=release
ninja -C build
meson install -C build
