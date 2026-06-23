#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

JDK_AARCH64_HTTP='https://download.oracle.com/java/21/latest/jdk-21_linux-aarch64_bin.tar.gz'
JDK_X64_HTTP='https://download.oracle.com/java/21/latest/jdk-21_linux-x64_bin.tar.gz'
ARCH="$(uname -m)"
if [[ "${ARCH}" = "aarch64" ]] || [[ "${ARCH}" = "arm64" ]]; then
    JDK_HTTP="${JDK_AARCH64_HTTP}"
else
    JDK_HTTP="${JDK_X64_HTTP}"
fi
JDK_FILE="${ROOT}/container-data/db/$(basename "${JDK_HTTP}")"
JDK_UNZIP_DIR="${ROOT}/container-data/db/jdk"

printf -- 'Removing any old JDK files...\n'
rm -rf "${JDK_FILE}" "${JDK_UNZIP_DIR:?}"/*
printf -- 'Completed\n'
printf -- '\n'

printf -- 'Downloading the latest JDK release...\n'
curl -L -o "${JDK_FILE}" "${JDK_HTTP}"
printf -- 'Completed\n'
printf -- '\n'

printf -- 'Unzipping the JDK release...\n'
mkdir -p "${JDK_UNZIP_DIR}"
tar -xzf "${JDK_FILE}" -C "${JDK_UNZIP_DIR}" --strip-components=1
chmod -R u+w "${JDK_UNZIP_DIR}"
printf -- 'Completed\n'
printf -- '\n'
