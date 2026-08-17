ARG FREEBSD_RELEASE

FROM ghcr.io/appjail-makejails/base:${FREEBSD_RELEASE}

ARG NO_PKGCLEAN

LABEL org.opencontainers.image.title="FreeBSD base (+tools)" \
    org.opencontainers.image.description="FreeBSD base image (+tools)" \
    org.opencontainers.image.source="https://github.com/AppJail-makejails/core" \
    org.opencontainers.image.url="https://github.com/AppJail-makejails/core" \
    org.opencontainers.image.vendor="DtxdF" \
    org.opencontainers.image.authors="Jesús Daniel Colmenares Oviedo <dtxdf@disroot.org>"

RUN set -xe; \
    \
    umask 0022; \
    \
    pkg update; \
    pkg install \
        su-exec-static \
        FreeBSD-utilities \
        FreeBSD-locales; \
    \
    if [ -z "${NO_PKGCLEAN}" ]; then \
        pkg clean -a; \
        rm -rf /var/cache/pkg/*; \
    fi; \
    rm -rf /var/db/pkg/repos/*; \
    \
# Prevent permission issues when a package is installed there.
    mkdir -p /usr/local/sbin; \
    chmod 755 /usr/local/sbin

ENV PUID=1000 \
    PGID=1000 \
    UMASK=0022

COPY lib.subr /lib.subr
