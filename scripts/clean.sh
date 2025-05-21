#!/bin/bash
set -e

# Remove unused packages
export BUILD_DEPS="ccache jq cmake zip pkg-config curl python3 libgtest-dev libgmock-dev g++ \
  make nasm unzip autoconf autoconf-archive ca-certificates automake ninja-build libfuse-dev"
apt-get purge -y --auto-remove $BUILD_DEPS && rm -rf /var/lib/apt/lists/*

# Check with:  du -xh / | sort -h | tail -20
rm -rf /tmp/build*
rm -rf /MEGAcmd
rm -rf /vcpkg
rm -rf /root/.cache

rm -rf /var/log/*.log
rm -rf /var/log/**/*.log
