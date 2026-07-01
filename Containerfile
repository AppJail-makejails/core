ARG FREEBSD_RELEASE

FROM ghcr.io/appjail-makejails/base:${FREEBSD_RELEASE}

LABEL org.opencontainers.image.title="FreeBSD base (+tools)" \
    org.opencontainers.image.description="FreeBSD base image (+tools)" \
    org.opencontainers.image.source="https://github.com/AppJail-makejails/core" \
    org.opencontainers.image.url="https://github.com/AppJail-makejails/core" \
    org.opencontainers.image.vendor="DtxdF" \
    org.opencontainers.image.authors="Jesús Daniel Colmenares Oviedo <dtxdf@disroot.org>"

ENV PUID=1000 \
    PGID=1000

COPY lib.subr /lib.subr
