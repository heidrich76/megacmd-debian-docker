# Docker Container for Building MEGAcmd under Debian Linux

This container is a proof of concept for building the MEGAcmd tool on Debian Linux.

The files are provided as-is. Use them at your own risk.

Images for **arm64** and **amd64** are automatically built and published on [Docker Hub](https://hub.docker.com/r/jensheidrich76/megacmd-debian-docker) under the repository `jensheidrich76/megacmd-debian-docker`.



## Getting Started

* **Build and start locally:**

  ```bash
  docker-compose up --build -d
  docker exec -it megacmd-debian-docker /bin/bash
  ```

* **Retrieve the latest image from Docker Hub:**

  ```bash
  docker run -it --pull always --entrypoint /bin/sh jensheidrich76/megacmd-debian-docker:latest
  ```



## Links

* [MEGAcmd source code and build instructions](https://github.com/meganz/MEGAcmd)



## Changes to the Original Build Chain

* Disabled `freeimage` in the build using `-DUSE_FREEIMAGE=OFF` (due to build issues on Debian arm64).
