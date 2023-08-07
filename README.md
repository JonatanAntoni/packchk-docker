# packchk-docker

Dockerized Open-CMSIS-Pack PackChk from https://github.com/Open-CMSIS-Pack/devtools.

## Usage

```sh
. $ docker run --mount type=bind,src=$(pwd),target=/workspace ghcr.io/jonatanantoni/packchk-docker:main [args] <pdsc>
```
