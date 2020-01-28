#! /usr/bin/env bash
# http://redsymbol.net/articles/unofficial-bash-strict-mode/

PATH=/usr/local/bin:/usr/local/opt/grep/libexec/gnubin:$PATH
current=$(grep version info.plist -A1 | tail -1 | grep -oP '\d.\d.\d')
latest=$(curl --silent https://api.github.com/repos/mhristof/alfred-tf-snippets/releases | jq '.[].assets[0].browser_download_url' -r | sort -h | tail -1)

echo $latest | grep $current &> /dev/null

if [[ $? -ne 0 ]] && [[ ! -z $latest ]]; then
    echo $latest
fi

exit 0
