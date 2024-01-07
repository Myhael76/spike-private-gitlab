#!/bin/sh

BASE_DIR=/opt/my-backup

display_usage(){
  echo "This utility expects the following files in order to restore the required volumes:"
  echo "MANDATORY: ${BASE_DIR}/conf.tgz ( ./backup/runner/conf.tgz on the host)"
  echo "MANDATORY: ${BASE_DIR}/data.tgz ( ./backup/runner/home.tgz on the host)"
  echo "OPTIONAL:  ${BASE_DIR}/logs.tgz ( ./backup/runner/home.tgz on the host)"
}

if [ ! -f "${BASE_DIR}/data.tgz" ]; then
  display_usage
  exit 1
fi

if [ ! -f "${BASE_DIR}/conf.tgz" ]; then
  display_usage
  exit 1
fi

cd /
tar xzf ${BASE_DIR}/conf.tgz
tar xzf ${BASE_DIR}/data.tgz
if [ -f "${BASE_DIR}/logs.tgz" ]; then
  tar xzf ${BASE_DIR}/logs.tgz
fi

exit 0
