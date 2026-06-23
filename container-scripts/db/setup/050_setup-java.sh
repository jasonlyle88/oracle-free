#!/usr/bin/env bash
set -euo pipefail

export JAVA_HOME="/jdk"
export PATH="${JAVA_HOME}/bin:$PATH"

{
    printf -- '\n'
    printf -- '# Setup Java\n'
    printf -- 'export JAVA_HOME="/jdk"\n'
    printf -- 'export PATH="${JAVA_HOME}/bin:${PATH}"\n'
} >> "${HOME}/.bashrc"
