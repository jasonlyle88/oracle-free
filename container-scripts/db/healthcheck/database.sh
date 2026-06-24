#!/usr/bin/env bash
set -euo pipefail

if ! "$ORACLE_BASE/$CHECK_DB_FILE" >/dev/null; then
    echo "Oracle database healthcheck has not passed yet" >&2
    exit 1
fi
