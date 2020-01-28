#! /usr/bin/env bash
# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'

cat << EOF
{"items": [
$(cat alfred/*.json)
{
    "uid": "update",
    "title": "update",
    "arg": "$(./check-for-new-release.sh)",
    "match": "update"
}
]}
EOF

exit 0
