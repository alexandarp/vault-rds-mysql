#!/bin/bash

USERNAME=$1
PASSWORD=$2
HOST=$3

# Enable Database Secrets Engine
vault secrets enable database

# Configure Vault with the proper plugin and connection information
vault write database/config/my-mysql-database \
    plugin_name=mysql-rds-database-plugin \
    connection_url="{{username}}:{{password}}@tcp(${HOST}:3306)/" \
    allowed_roles="my-role" \
    username="${USERNAME}" \
    password="${PASSWORD}"

# Configure a role that maps a name in Vault to an SQL statement to execute to create the database credential
vault write database/roles/my-role \
    db_name=my-mysql-database \
    creation_statements="CREATE USER '{{name}}'@'%' IDENTIFIED BY '{{password}}';GRANT SELECT ON *.* TO '{{name}}'@'%';" \
    default_ttl="1h" \
    max_ttl="24h"
