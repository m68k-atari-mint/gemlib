#!/bin/bash -ex
# -e: Exit immediately if a command exits with a non-zero status.
# -x: Display expanded script commands

# use as build.sh <dest dir> (i.e. the files will be installed to <dest dir>/<sys-root>/usr)

export PREFIX="$($TOOL_PREFIX-gcc -print-sysroot)/usr"

make CROSS_TOOL=${TOOL_PREFIX}
make CROSS_TOOL=${TOOL_PREFIX} PREFIX="${1}${PREFIX}" install
