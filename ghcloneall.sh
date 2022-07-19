#!/bin/bash
USAGE="USAGE: ghcloneall <github username>"
GHUSER=$1
if ! [[ $1 ]]; then
    echo $USAGE; exit 1
fi
curl "https://api.github.com/users/$GHUSER/repos?per_page=1000" | grep -w clone_url | grep -o '[^"]\+://.\+.git' | xargs -L1 git clone