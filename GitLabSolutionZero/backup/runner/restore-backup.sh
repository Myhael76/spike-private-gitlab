#!/bin/sh

BASE_DIR=/opt/my-backup

display_usage(){
  echo "This utility expects the following files in order to restore the required volumes:"
  echo "${BASE_DIR}/conf.tgz ( ./backup/runner/conf.tgz on the host)"
  echo "${BASE_DIR}/home.tgz ( ./backup/runner/home.tgz on the host)"
}

if [ ! -f "${BASE_DIR}/home.tgz" ]; then
  display_usage
  exit 1
fi

if [ ! -f "${BASE_DIR}/conf.tgz" ]; then
  display_usage
  exit 1
fi

cd /
tar xzf ${BASE_DIR}/conf.tgz
tar xzf ${BASE_DIR}/home.tgz

exit 0
