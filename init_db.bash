#! /bin/bash

if [[ -n "$FDB_INIT_DB_FILE_CONTENTS" ]]; then
    while ! nc -z localhost $FDB_PORT; do   
        sleep 0.1 # wait for 1/10 of the second before check again
    done
    sleep $FDB_INIT_DB_SLEEP
    echo "Init DB with : fdbcli --exec "$FDB_INIT_DB_FILE_CONTENTS""
    fdbcli --exec "$FDB_INIT_DB_FILE_CONTENTS"
fi