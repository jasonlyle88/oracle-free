#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

printf -- 'Resetting container environment...\n'

mkdir -p "${ROOT}/container-data/db/apex"
mkdir -p "${ROOT}/container-data/db/apex-install"
mkdir -p "${ROOT}/container-data/db/oradata"
mkdir -p "${ROOT}/container-data/ords"

find "${ROOT}/container-data/db/apex-install" -mindepth 1 ! -name '.gitkeep' -delete
find "${ROOT}/container-data/db/oradata" -mindepth 1 ! -name '.gitkeep' -delete
find "${ROOT}/container-data/ords" -mindepth 1 ! -name '.gitkeep' -delete

printf -- 'Container environment reset complete.\n'
printf -- 'To get the latest version of Java, re-run "prepare-java.sh".\n'
printf -- 'To get the latest version of SQLcl, re-run "prepare-sqlcl.sh".\n'
printf -- 'To get the latest version of APEX, re-run "prepare-apex.sh".\n'
