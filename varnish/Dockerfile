# mxabierto Varnish
# Varnish - HTTP accelerator
# https://www.varnish-cache.org/docs
#
# Build:
#   docker build -t mxabierto/varnish .
# Usage:
#   docker run \
#   -dP --link CONTAINER_ID:backend \
#   mxabierto/varnish

FROM debian:jessie

MAINTAINER bcessa <ben@pixative.com>

ENV \
  CACHE_SIZE=128m

ADD start.sh /start.sh

RUN \
  apt-get update && \
  apt-get install -y varnish && \
  chmod 775 /start.sh

# Cache http port and telnet interface
EXPOSE 6081

# Run as binary
ENTRYPOINT [ "/start.sh" ]
