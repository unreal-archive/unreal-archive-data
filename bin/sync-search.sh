#!/bin/sh

## Variables set by CI
#   MSE_URL   - base url of Minimum Effort Search service instance
#   MSE_TOKEN - service token to allow posting documents
#   SITE_URL  - published website root url

UA_VERSION=latest
UA_BIN=/tmp/unreal-archive

set -e

# download unreal-archive binary
if [ ! -f ${UA_BIN} ]; then
  echo "Downloading unreal-archive binary"
  curl https://code.shrimpworks.za.net/artefacts/unreal-archive/${UA_VERSION}/unreal-archive --output ${UA_BIN}
  chmod +x ${UA_BIN}
fi

# post documents to search index
echo "Verify content"
${UA_BIN} search-submit --content-path=$1 --store=NOP
