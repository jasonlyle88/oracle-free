#!/usr/bin/env bash
set -euo pipefail

export PATH="/sqlcl/bin:$PATH"

{
    printf -- '\n'
    printf -- '# Setup SQLcl\n'
    printf -- 'export PATH="/sqlcl/bin:${PATH}"\n'
} >> "${HOME}/.bashrc"

ORACLE_HOME_BINARY_DIRECTORY="$(dirname "$(command -v 'sqlplus')")"
SQL_BINARY="$(command -v 'sql')"

if [[ ! -f "${ORACLE_HOME_BINARY_DIRECTORY}/sql" ]]; then
    ln -s "${SQL_BINARY}" "${ORACLE_HOME_BINARY_DIRECTORY}/sql"
fi
