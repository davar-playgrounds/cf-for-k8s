#! /bin/bash

pushd repo > /dev/null
  GIT_SHA=$(git rev-parse HEAD)
popd > /dev/null

echo "yttifying"
ytt -f kbld-template.yml -f kbld-data-values.yml -v "eirini.git_sha=${GIT_SHA}" > kbld-config.yml
echo "kblding"
kbld -f kbld-config.yml -f images.yml --lock-output kbld.lock.yml > kbld-output.yml
echo "is great success!"