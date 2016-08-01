# mxabierto CKAN-DATAPUSHER
# Base mxabierto/ckan-datapusher installation
# Heavily based on datacats ( https://github.com/datacats/datacats )
# Build:
#   docker build -t mxabierto/ckan-datapusher .
# Usage:
#   docker run --rm -itP mxabierto/ckan-datapusher

# Base image
FROM mxabierto/ckan
MAINTAINER Francisco Vaquero <francisco@opi.la>

# Instalacion de los requrimientos del datapusher
RUN apt-get install python-dev python-virtualenv build-essential libxslt1-dev libxml2-dev git

# Instalacion del datapusher
RUN \
  virtualenv $CKAN_HOME/datapusher && \
  $CKAN_HOME/datapusher/bin/pip install -r /project/datapusher/requirements.txt && \
  $CKAN_HOME/datapusher/bin/python /project/datapusher/setup.py develop

#Configuracion del webserver
RUN \
  cp /project/datapusher/deployment/datapusher.conf /etc/apache2/sites-available/datapusher.conf && \
  cp /project/datapusher/deployment/datapusher.wsgi /etc/ckan/ && \
  cp /project/datapusher/deployment/datapusher_settings.py /etc/ckan/ && \
  sh -c 'echo "NameVirtualHost *:8800" >> /etc/apache2/ports.conf' && \
  sh -c 'echo "Listen 8800" >> /etc/apache2/ports.conf' && \
  a2ensite datapusher

# Se agregan los archivos de configuracion
ADD develop.ini /project/development.ini
ADD ckan_default.conf /etc/apache2/sites-available/ckan_default.conf
ADD start.sh /start.sh

EXPOSE 8800

ENTRYPOINT ["/start.sh"]
