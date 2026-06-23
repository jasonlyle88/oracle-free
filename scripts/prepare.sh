#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

. "${ROOT}/scripts/prepare-java.sh"
. "${ROOT}/scripts/prepare-sqlcl.sh"
. "${ROOT}/scripts/prepare-apex.sh"
