#! /usr/bin/env bash
# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'

file="$1"
base="$(basename "$file" .html.markdown)"

cat << EOF > "$file.json"
{
    "uid": "$file",
    "title": "$base",
    "arg": "$file",
    "match": "$(echo "$base" | tr -s '_-' ' ')"
},
EOF

exit 0
