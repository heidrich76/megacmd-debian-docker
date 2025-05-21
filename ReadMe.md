# Docker Container for Building MEGAcmd under Debian Linux

This container is a proof of concept, which builds MEGAcmd tool in a Debian container using VCPKG as build system.

The files are just provided as-is. Use them at your own risk.

Build was tested under x64 and arm64 Debian container using Windows and MacOS respectively.


## Getting started
- Docker commands to build and start:
    ```bash
    docker-compose up --build -d
    docker exec -it debmega /bin/bash
    ```


# Links
- MEGAcmd source code and build instructions: https://github.com/meganz/MEGAcmd


# Changes to original build chain
- Exclude `freeimage` from build with option `-DUSE_FREEIMAGE=OFF` (has issues building under Alpine).
