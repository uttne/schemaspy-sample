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

if [ -z ${SERVER_PASS+x} ] ; then
  echo "'SERVER_PASS' is not found."
fi

echo "wait connection"

/usr/bin/mysql --host=$SERVER_HOST --database=$SERVER_DB --user=$SERVER_USER --password=${SERVER_PASS} --execute="SELECT 1;" > /dev/null 2>&1
is_error=$?

counter=1

while [ $is_error -gt 0 ]
do
    sleep 2
    echo "retry connect. (${counter})"
    /usr/bin/mysql --host=$SERVER_HOST --database=$SERVER_DB --user=$SERVER_USER --password=${SERVER_PASS} --execute="SELECT 1;" > /dev/null 2>&1
    is_error=$?

    counter=$(( $counter + 1 ))

    if [ $counter -ge 20 ]; then
        echo "connection error!!"
        exit 1
    fi
done

echo "conected!!"
