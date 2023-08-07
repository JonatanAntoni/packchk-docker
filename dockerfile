FROM ubuntu:22.04

ARG TARGETOS
ARG TARGETARCH
ARG DEBIAN_FRONTEND=noninteractive

RUN --mount=target=/var/lib/apt/lists,type=cache,sharing=locked \
    --mount=target=/var/cache/apt,type=cache,sharing=locked \
    apt-get update && \
    apt-get install -y curl

ARG TOOLBOX_DIST=cmsis-toolbox-${TARGETOS}-${TARGETARCH}
ARG TOOLBOX_ARCHIVE=${TOOLBOX_DIST}.tar.gz

RUN curl -L -O https://github.com/Open-CMSIS-Pack/cmsis-toolbox/releases/download/2.0.0/${TOOLBOX_ARCHIVE} && \
    tar -xf ${TOOLBOX_ARCHIVE} && \
    rm ${TOOLBOX_ARCHIVE} && \
    mv ${TOOLBOX_DIST} /opt/cmsis-toolbox && \
    curl -LO https://github.com/Open-CMSIS-Pack/Open-CMSIS-Pack-Spec/raw/main/schema/PACK.xsd && \
    mv PACK.xsd /opt/cmsis-toolbox/etc

ENV PATH=$PATH:/opt/cmsis-toolbox/bin

# RUN cpackget init https://www.keil.com/pack/index.pidx && \
#    cpackget update-index -a

WORKDIR /workspace

ENTRYPOINT [ "packchk" ]
