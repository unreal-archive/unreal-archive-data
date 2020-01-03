#!/bin/sh

## Variables set by CI
#   PUB_USER  - username for PUB_KEY
#   PUB_KEY   - SSH private key for PUB_USER (base64 encoded, then newlines replaced with "-")
#   PUB_HOST  - host to rsync files to
#   PUB_ROOT  - path on PUB_HOST to upload files to
#   SITE_URL  - published website root url

UA_VERSION=latest
UA_BIN=/tmp/unreal-archive

WWW_LOCATION=/tmp/ua-www

export STATIC_ROOT="${SITE_URL}/static"

set -e

# download unreal-archive binary
if [ ! -f ${UA_BIN} ]; then
  echo "Downloading unreal-archive binary"
  curl https://code.shrimpworks.za.net/artefacts/unreal-archive/${UA_VERSION}/unreal-archive --output ${UA_BIN}
  chmod +x ${UA_BIN}
fi

# execute unreal-archive www command
echo "Building static content"
mkdir -p ${WWW_LOCATION}
${UA_BIN} www ${WWW_LOCATION} --content-path=$1 --store=NOP \
  --with-search=true \
  --with-latest=true \
  --with-submit=true

# prepare private key
echo "Preparing upload credentials"
set +x
echo ${PUB_KEY} | sed 's/-/\n/g' | base64 --decode > /tmp/deploy_key
chmod 600 /tmp/deploy_key
set -x

# publish files via rsync
echo "Publishing content"
rsync -rzh -e"ssh -i /tmp/deploy_key" ${WWW_LOCATION}/* ${PUB_USER}@${PUB_HOST}:${PUB_ROOT}
