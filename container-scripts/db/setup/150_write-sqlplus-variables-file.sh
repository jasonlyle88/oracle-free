#!/usr/bin/env bash
set -euo pipefail

SQL_FILE="/tmp/sqlplus-variables.sql"

touch "${SQL_FILE}"

chmod 600 "${SQL_FILE}"

{
    printf -- 'DEFINE %s = %s\n' "ORACLE_PDB" "${ORACLE_PDB:-FREEPDB1}"
    printf -- 'DEFINE %s = %s\n' "APEX_TABLESPACE_NAME" "${APEX_TABLESPACE_NAME:-APEX}"
    printf -- 'DEFINE %s = %s\n' "APEX_TABLESPACE_FILE_NAME" "${APEX_TABLESPACE_FILE_NAME:-apex_001.dbf}"
    printf -- 'DEFINE %s = %s\n' "APEX_PUBLIC_USER_PWD" "${APEX_PUBLIC_USER_PWD:-password}"
    printf -- 'DEFINE %s = %s\n' "APEX_LISTENER_PWD" "${APEX_LISTENER_PWD:-password}"
    printf -- 'DEFINE %s = %s\n' "APEX_REST_PUBLIC_USER_PWD" "${APEX_REST_PUBLIC_USER_PWD:-password}"
    printf -- 'DEFINE %s = %s\n' "APEX_ADMIN_PWD" "${APEX_ADMIN_PWD:-password}"
} > "${SQL_FILE}"