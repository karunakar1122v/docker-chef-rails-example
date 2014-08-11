#!/bin/bash
set -e

POSTGRES_BIN_PATH=/usr/lib/postgresql/9.3/bin
POSTGRES_DATA=/pgdata


if find $POSTGRES_DATA -maxdepth 0 -empty | read v; then
    mkdir -p $POSTGRES_DATA
    chown -R postgres:postgres $POSTGRES_DATA
    sudo -u postgres $POSTGRES_BIN_PATH/initdb -D $POSTGRES_DATA -E UTF8
    sudo -u postgres $POSTGRES_BIN_PATH/postgres --single <<< "CREATE USER $POSTGRES_USER WITH SUPERUSER;"
    sudo -u postgres $POSTGRES_BIN_PATH/postgres --single <<< "ALTER USER $POSTGRES_USER WITH PASSWORD '$POSTGRES_PASSWORD';"
    sudo -u postgres $POSTGRES_BIN_PATH/postgres --single  <<< "CREATE DATABASE $POSTGRES_USER OWNER $POSTGRES_USER;"
fi

exec sudo -u postgres $POSTGRES_BIN_PATH/postgres
