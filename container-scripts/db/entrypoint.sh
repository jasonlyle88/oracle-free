#!/usr/bin/env bash
set -euo pipefail

RUN_SCRIPTS_FILE='/opt/oracle/runUserScripts.sh'

cp -a "${RUN_SCRIPTS_FILE}" "${RUN_SCRIPTS_FILE}.bak"

sed -i 's|/bin/sqlplus -s|/bin/sql -S|g' "$RUN_SCRIPTS_FILE"
sed -i 's|"/ as sysdba"|/ as sysdba|g' "$RUN_SCRIPTS_FILE"

# Execute the original entrypoint script
bash -c "$ORACLE_BASE/$RUN_FILE"
