#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

SQLCL_ZIP_HTTP='https://download.oracle.com/otn_software/java/sqldeveloper/sqlcl-latest.zip'
SQLCL_ZIP_FILE="${ROOT}/container-data/db/sqlcl-latest.zip"
SQLCL_UNZIP_DIR="${ROOT}/container-data/db/sqlcl"

printf -- 'Removing any old files...\n'
rm -rf "${SQLCL_ZIP_FILE}" "${SQLCL_UNZIP_DIR:?}"/*
printf -- 'Completed\n'
printf -- '\n'

printf -- 'Downloading the latest SQLCL release...\n'
curl -L -o "${SQLCL_ZIP_FILE}" "${SQLCL_ZIP_HTTP}"
printf -- 'Completed\n'
printf -- '\n'

printf -- 'Unzipping the SQLCL release...\n'
unzip "${SQLCL_ZIP_FILE}" -d "${SQLCL_UNZIP_DIR}"

if [ -d "${SQLCL_UNZIP_DIR}/sqlcl" ]; then
    mv "${SQLCL_UNZIP_DIR}/sqlcl"/* "${SQLCL_UNZIP_DIR}/"
    rm -rf "${SQLCL_UNZIP_DIR}/sqlcl"
fi

printf -- 'Completed\n'
printf -- '\n'
