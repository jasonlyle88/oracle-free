#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

APEX_ZIP_HTTP='https://download.oracle.com/otn_software/apex/apex-latest.zip'
APEX_ZIP_FILE="${ROOT}/container-data/db/apex-latest.zip"
APEX_UNZIP_DIR="${ROOT}/container-data/db/apex"

printf -- 'Removing any old files...\n'
rm -rf "${APEX_ZIP_FILE}" "${APEX_UNZIP_DIR:?}"/*
printf -- 'Completed\n'
printf -- '\n'

printf -- 'Downloading the latest public APEX release...\n'
curl -L -o "${APEX_ZIP_FILE}" "${APEX_ZIP_HTTP}"
printf -- 'Completed\n'
printf -- '\n'

printf -- 'Unzipping the APEX release...\n'
unzip "${APEX_ZIP_FILE}" -d "${APEX_UNZIP_DIR}"

rm -rf "${APEX_UNZIP_DIR:?}/META-INF"
if [ -d "${APEX_UNZIP_DIR}/apex" ]; then
    mv "${APEX_UNZIP_DIR}/apex"/* "${APEX_UNZIP_DIR}/"
    rm -rf "${APEX_UNZIP_DIR}/apex"
fi

# Remove any spool commands from the installation script
cp -a "${APEX_UNZIP_DIR}/apxsilentins.sql" "${APEX_UNZIP_DIR}/apxsilentins.sql.tmp"
sed 's|^spool .*$||g' "${APEX_UNZIP_DIR}/apxsilentins.sql" > "${APEX_UNZIP_DIR}/apxsilentins.sql.tmp"
mv "${APEX_UNZIP_DIR}/apxsilentins.sql.tmp" "${APEX_UNZIP_DIR}/apxsilentins.sql"
rm -f "${APEX_UNZIP_DIR}/apxsilentins.sql.tmp"

printf -- 'Completed\n'
printf -- '\n'
