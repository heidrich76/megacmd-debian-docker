# Basis for running application
FROM debian:12-slim AS base
RUN apt-get update && apt-get install -y --no-install-recommends \
  bash fuse git nano zstd


# Basis for building application
FROM base AS builder-base
RUN apt-get install -y --no-install-recommends \
  autoconf autoconf-archive automake ca-certificates ccache cmake curl g++ \
  jq libfuse-dev libgmock-dev libgtest-dev make nasm ninja-build pkg-config \
  python3 unzip zip
COPY scripts /opt/scripts


# Actual build of application
FROM builder-base AS builder
RUN bash /opt/scripts/build.sh


# Final stage
FROM base AS final
COPY --from=builder /tmp/mega_install /