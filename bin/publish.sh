#!/bin/sh

## Variables set by CI
#   PUB_USER  - username for PUB_KEY
#   PUB_KEY   - SSH private key for PUB_USER (base64 encoded, then newlines replaced with "-")
#   PUB_HOST  - host to rsync files to
#   PUB_ROOT  - path on PUB_HOST to upload files to
#   SITE_URL  - published website root url

UA_VERSION=latest
UA_BIN=/tmp/ua/bin/www

WWW_LOCATION=/tmp/ua-www

export STATIC_ROOT="${SITE_URL}/static"

set -e

# execute unreal-archive www command
echo "Building static content"
mkdir -p ${WWW_LOCATION}
${UA_BIN} www ${WWW_LOCATION} --content-path=$1 --store=NOP \
  --with-search=true \
  --with-latest=true \
  --with-submit=true \
  --with-packages=true \
  --with-wikis=true

# prepare private key
echo "Preparing upload credentials"
set +x
echo ${PUB_KEY} | sed 's/-/\n/g' | base64 --decode > /tmp/deploy_key
chmod 600 /tmp/deploy_key
set -x

# publish files via rsync
echo "Publishing content"
rsync -rzht -e"ssh -i /tmp/deploy_key -o StrictHostKeychecking=no" ${WWW_LOCATION}/* ${PUB_USER}@${PUB_HOST}:${PUB_ROOT}
