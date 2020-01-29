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

directory=$(basename $file | cut -d '-' -f1)
web_file=$(echo $file | cut -d '-' -f2-)

cat << EOF >> "$file.json"
{
    "uid": "w-$file",
    "title": "web $base",
    "arg": "https://www.terraform.io/docs/providers/aws/$directory/$(basename $web_file .markdown)",
    "match": "w$(echo "$base" | tr -s '_-' ' ')"
},
EOF


exit 0
