#!/usr/bin/env bash
set -x

echo "===== INICIO ====="
pwd
ls -la

WORKDIR="$(mktemp -d)"
echo "WORKDIR=$WORKDIR"

cd "$WORKDIR" || exit 1

git clone https://github.com/project-repo/cagebreak.git
cd cagebreak || exit 1

git checkout 0d9d8ea34a6dc2f21c5c6176f3e0cf29887e2a88

echo "===== CONFIGURANDO ====="

meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dxwayland=true || {
    cat build/meson-logs/meson-log.txt 2>/dev/null
    exit 1
}

echo "===== COMPILANDO ====="

meson compile -C build --verbose || {
    cat build/meson-logs/meson-log.txt
    exit 1
}

echo "===== INSTALANDO ====="

DESTDIR=/ meson install -C build

echo "===== FIN ====="
