#!/bin/bash

if [ -z ${SQLSERVER_HOST+x} ] ; then
  echo "'SQLSERVER_HOST' is not found."
fi

if [ -z ${SQLSERVER_USER+x} ] ; then
  echo "'SQLSERVER_HOST' is not found."
fi

if [ -z ${SQLSERVER_PASS+x} ] ; then
  echo "'SQLSERVER_HOST' is not found."
fi


echo "wait connection"

/opt/mssql-tools/bin/sqlcmd -S $SQLSERVER_HOST -U $SQLSERVER_USER -P $SQLSERVER_PASS -l 2 -Q "SELECT TOP 1 1 FOM sys.databases;" > /dev/null 2>&1
is_error=$?

counter=1

while [ $is_error -gt 0 ]
do
    sleep 1
    echo "retry connect. (${counter})"
    /opt/mssql-tools/bin/sqlcmd -S $SQLSERVER_HOST -U $SQLSERVER_USER -P $SQLSERVER_PASS -l 2 -Q "SELECT TOP 1 1 FOM sys.databases;" > /dev/null 2>&1
    is_error=$?

    counter=$(( $counter + 1 ))

    if [ $counter -ge 20 ]; then
        echo "connection error!!"
        exit 1
    fi
done

echo "conected!!"
