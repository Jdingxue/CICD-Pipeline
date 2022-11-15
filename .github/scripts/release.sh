#!/bin/bash

VER=$1

if [[ -z "$VER" ]]; then
  echo "Error! Supply version tag!"
  exit 1
fi

read -r -d '' NOTES << EOM
\`\`\`
docker pull ghcr.io/benc-uk/python-demoapp:$VER
\`\`\`

\`\`\`
docker run --rm -it -p 80:8080 ghcr.io/benc-uk/python-demoapp:$VER
\`\`\`
EOM

gh release create $VER --title "Release v$VER" -n "$NOTES"
