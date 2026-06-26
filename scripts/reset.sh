#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

printf -- 'Resetting container environment...\n'

################################################################################

mkdir -p "${ROOT}/container-data/ords/apex"
touch "${ROOT}/container-data/ords/apex/.gitkeep"
#
mkdir -p "${ROOT}/container-data/ords/ssl"
touch "${ROOT}/container-data/ords/ssl/.gitkeep"

################################################################################

mkdir -p "${ROOT}/container-scripts/db/setup"
touch "${ROOT}/container-scripts/db/setup/.gitkeep"
#
mkdir -p "${ROOT}/container-scripts/db/startup"
touch "${ROOT}/container-scripts/db/startup/.gitkeep"
#
mkdir -p "${ROOT}/container-scripts/ords/startup"
touch "${ROOT}/container-scripts/ords/startup/.gitkeep"

################################################################################

printf -- 'Container environment reset complete.\n'
printf -- 'To get the latest version of APEX, re-run "prepare-apex.sh".\n'
