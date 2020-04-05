#!/bin/bash

set -eu

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

RELEASE_INFO_URL="https://buildkite.com/agent/releases/latest?platform=linux&arch=amd64"
LATEST_RELEASE=$(curl -s "$RELEASE_INFO_URL")

VERSION=$(echo "$LATEST_RELEASE"           | awk -F= '/version=/  { print $2 }')
DOWNLOAD_FILENAME=$(echo "$LATEST_RELEASE" | awk -F= '/filename=/ { print $2 }')
DOWNLOAD_URL=$(echo "$LATEST_RELEASE"      | awk -F= '/url=/      { print $2 }')

echo -e "Updating Version: \033[35mv$VERSION\033[0m"

BLOB_CLEANUP="buildkite-agent-linux-amd64-.*"
blobs_to_remove=$(spruce json config/blobs.yml | jq -r "keys[] | select(test(\"${BLOB_CLEANUP}\"))")
[[ -n $blobs_to_remove ]] && {
  echo "$blobs_to_remove" | xargs -L1 bosh remove-blob
}

curl -L $DOWNLOAD_URL -o $DOWNLOAD_FILENAME

bosh add-blob $DOWNLOAD_FILENAME $DOWNLOAD_FILENAME

rm $DOWNLOAD_FILENAME
