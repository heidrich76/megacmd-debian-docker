#!/bin/bash
set -e

# Clone VCPKG source code und bootstrap app
git clone --branch 2025.04.09 --single-branch https://github.com/microsoft/vcpkg.git /vcpkg
cd /vcpkg && ./bootstrap-vcpkg.sh

# Clone MEGAcmd source code und update dependencies
git clone --branch 2.1.1_Linux --single-branch --depth 1 https://github.com/meganz/MEGAcmd.git /MEGAcmd
cd /MEGAcmd
git submodule update --init --recursive

# Determine triplet to use
cd /MEGAcmd
triplet=$(uname -m | sed -e 's/x86_64/x64-linux/' -e 's/aarch64/arm64-linux/')

# Build MEGAcmd dependencies
cmake -B /tmp/build/ -DCMAKE_BUILD_TYPE=Release -DUSE_FREEIMAGE=OFF -DVCPKG_TARGET_TRIPLET="$triplet"

# Build MEGAcmd code
cmake --build /tmp/build/

# Install MEGAcmd
cmake --install /tmp/build/