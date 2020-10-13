#!/bin/bash

if [ -z ${SERVER_HOST+x} ] ; then
  echo "'SERVER_HOST' is not found."
fi

if [ -z ${SERVER_DB+x} ] ; then
  echo "'SERVER_DB' is not found."
fi

if [ -z ${SERVER_USER+x} ] ; then
  echo "'SERVER_USER' is not found."
fi

echo "wait connection"

/usr/bin/psql -h $SERVER_HOST -d $SERVER_DB -U $SERVER_USER -c "SELECT 1;" > /dev/null 2>&1
is_error=$?

counter=1

while [ $is_error -gt 0 ]
do
    sleep 1
    echo "retry connect. (${counter})"
    /usr/bin/psql -h $SERVER_HOST -d $SERVER_DB -U $SERVER_USER -c "SELECT 1;" > /dev/null 2>&1
    is_error=$?

    counter=$(( $counter + 1 ))

    if [ $counter -ge 20 ]; then
        echo "connection error!!"
        exit 1
    fi
done

echo "conected!!"
