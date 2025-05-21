FROM debian:12-slim

ARG MODE=none

# Update packages, no upgrade because of potential arm64 emulation
RUN apt-get update

# Store required packages
RUN export DEPS="bash nano git uuid-runtime zstd fuse" && \
  export BUILD_DEPS="ccache jq cmake zip pkg-config curl python3 libgtest-dev libgmock-dev g++ \
  make nasm unzip autoconf autoconf-archive ca-certificates automake ninja-build libfuse-dev" && \
  apt-get install -y --no-install-recommends $DEPS $BUILD_DEPS && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

# Build and clean
COPY scripts /opt/scripts
RUN if [ "$MODE" = "build" ] || [ "$MODE" = "clean" ]; then \
  bash /opt/scripts/build.sh; \
  fi

RUN if [ "$MODE" = "clean" ]; then \
  bash /opt/scripts/clean.sh; \
  fi

CMD ["/bin/bash"]
