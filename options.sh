#! /usr/bin/env bash
# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'

this="$(dirname "$0")"

cat << EOF
{"items": [
$(cat "$this"/alfred/*.json)
{}
]}
EOF

exit 0
