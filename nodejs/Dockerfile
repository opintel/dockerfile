# mxabierto nodejs
# Minimal nodejs LTS installation
#
# Build:
#   docker build -t mxabierto/nodejs .
# Usage:
#   docker run --rm -it mxabierto/nodejs

# Base image
FROM mxabierto/alpine

MAINTAINER bcessa <ben@pixative.com>

# Extra packages
RUN \
  apk-install nodejs && \
  npm install -g npm@latest && \
  rm -rf \
    /usr/share/man \
    /tmp/* \
    /var/cache/apk/* \
    /root/.npm \
    /root/.node-gyp \
    /usr/lib/node_modules/npm/man \
    /usr/lib/node_modules/npm/doc \
    /usr/lib/node_modules/npm/html

# Run as binary
ENTRYPOINT ["node"]
