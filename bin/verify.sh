#!/bin/sh

UA_VERSION=latest
UA_BIN=/tmp/ua/unreal-archive

set -e

# download unreal-archive binary
if [ ! -f ${UA_BIN} ]; then
  echo "Downloading unreal-archive binary"
  curl https://code.shrimpworks.za.net/artefacts/unreal-archive/${UA_VERSION}/unreal-archive --output ${UA_BIN}
  chmod +x ${UA_BIN}
fi

# execute unreal-archive www command
echo "Verify content"
${UA_BIN} summary --content-path=$1 --store=NOP
