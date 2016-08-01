#!/bin/sh

# Adjust config file
sed -i -e "s|#solr_url = http://127.0.0.1:8983/solr|solr_url = http://$SOLR_PORT_8983_TCP_ADDR:$SOLR_PORT_8983_TCP_PORT/solr|" /project/development.ini
sed -i -e "s|ckan.site_url =|ckan.site_url = $CKAN_SITE_URL|" /project/development.ini
sed -i -e "s|ckan_default:pass@localhost/ckan_default|$POSTGRES_ENV_POSTGRES_USER:$POSTGRES_ENV_POSTGRES_PASSWORD@$POSTGRES_PORT_5432_TCP_ADDR/$POSTGRES_ENV_POSTGRES_DB|" /project/development.ini
sed -i -e "s|datastore_default:pass@localhost/datastore_default|$POSTGRES_ENV_USER_DATASTORE:$POSTGRES_ENV_POSTGRES_PASSWORD@$POSTGRES_PORT_5432_TCP_ADDR/$POSTGRES_ENV_DATABASE_DATASTORE|" /project/development.ini
sed -i -e "s|hostname:port:database:username:password|$POSTGRES_PORT_5432_TCP_ADDR:5432:$POSTGRES_ENV_POSTGRES_DB:$POSTGRES_ENV_POSTGRES_USER:$POSTGRES_ENV_POSTGRES_PASSWORD|" /root/.pgpass

# Serve site
exec apachectl -DFOREGROUND

