#!/usr/bin/env bash
set -euo pipefail

APEX_STATUS="$(
    sqlplus -L -S / as sysdba <<SQL
set heading off feedback off pagesize 0 verify off echo off
whenever sqlerror exit 1
alter session set container=${ORACLE_PDB:-FREEPDB1};
select coalesce(max(status), 'NOT_INSTALLED')
from dba_registry
where comp_id = 'APEX';
exit
SQL
)" || {
    echo "Could not query APEX registry status" >&2
    exit 1
}

APEX_STATUS="$(printf '%s' "$APEX_STATUS" | tr -d '[:space:]')"

if [ "$APEX_STATUS" != "VALID" ]; then
    echo "APEX registry status is ${APEX_STATUS:-UNKNOWN}" >&2
    exit 1
fi
