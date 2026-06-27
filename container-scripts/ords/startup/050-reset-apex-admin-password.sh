#!/usr/bin/env bash
set -euo pipefail

APEX_HOME="/opt/oracle/apex"

if [ -z "${APEX_ADMIN_PWD:-}" ]; then
    printf '%s\n' 'ERROR: APEX_ADMIN_PWD is required to configure the APEX ADMIN user.'
    exit 1
fi

if [ ! -f "${APEX_HOME}/apxchpwd.sql" ]; then
    printf 'ERROR: %s was not found.\n' "${APEX_HOME}/apxchpwd.sql"
    exit 1
fi

case "${DBSERVICENAME:-}" in
    '')
        printf '%s\n' 'ERROR: DBSERVICENAME is required to configure the APEX ADMIN user.'
        exit 1
        ;;
esac

printf '%s\n' 'INFO : Configuring APEX ADMIN user password.'

cd "${APEX_HOME}"
sql -S -noupdates -L sys/"${ORACLE_PWD}"@"${DBHOST}":"${DBPORT}"/"${DBSERVICENAME}" as sysdba @apxchpwd.sql<<SQL
ADMIN
admin@example.com
${APEX_ADMIN_PWD}
exit
SQL

printf '%s\n' 'INFO : APEX ADMIN user password configured.'
