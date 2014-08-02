#!/bin/bash
set -e

POSTGRES_BIN_PATH=/usr/lib/postgresql/9.3/bin
POSTGRES_CONFIG_FILE=/config/postgres/postgresql.conf
POSTGRES_HBA_FILE=/config/postgres/pg_hba.conf
POSTGRES_DATA=/pgdata


if find $POSTGRES_DATA -maxdepth 0 -empty | read v; then
    mkdir -p $POSTGRES_DATA
    chown -R postgres:postgres $POSTGRES_DATA
    sudo -u postgres $POSTGRES_BIN_PATH/initdb -D $POSTGRES_DATA -E UTF8
    sudo -u postgres $POSTGRES_BIN_PATH/postgres --single --config-file=$POSTGRES_CONFIG_FILE <<< "CREATE USER $POSTGRES_USER WITH SUPERUSER;"
    sudo -u postgres $POSTGRES_BIN_PATH/postgres --single --config-file=$POSTGRES_CONFIG_FILE <<< "ALTER USER $POSTGRES_USER WITH PASSWORD '$POSTGRES_PASSWORD';"
    sudo -u postgres $POSTGRES_BIN_PATH/postgres --single --config-file=$POSTGRES_CONFIG_FILE <<< "CREATE DATABASE $POSTGRES_USER OWNER $POSTGRES_USER;"
fi

exec sudo -u postgres $POSTGRES_BIN_PATH/postgres --config-file=$POSTGRES_CONFIG_FILE --hba_file=$POSTGRES_HBA_FILE
