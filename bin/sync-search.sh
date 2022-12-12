#!/bin/sh

## Variables set by CI
#   MSE_CONTENT_URL   - base url of Minimum Effort Search service instance
#   MSE_CONTENT_TOKEN - service token to allow posting documents
#   SITE_URL  - published website root url

UA_VERSION=latest
UA_BIN=/tmp/ua/unreal-archive

set -e

# TODO only continue if content hash has changed - don't re-index on every build
#CONTENT_HASH=$(find ./content -type f -print0 | sort -z | xargs -0 sha1sum | sha1sum | cut -d' ' -f1)

# download unreal-archive binary
if [ ! -f ${UA_BIN} ]; then
  echo "Downloading unreal-archive binary"
  curl https://code.shrimpworks.za.net/artefacts/unreal-archive/${UA_VERSION}/unreal-archive --output ${UA_BIN}
  chmod +x ${UA_BIN}
fi

# post documents to search index
echo "Submit to search index"
${UA_BIN} search-submit --content-path=$1 --store=NOP
