#!/bin/bash
set -e

COMPAT_TABLE_COMMIT=09d24e559a39884eee5749e5a60c1e3cc859196b
GIT_HEAD=build/compat-table/.git/HEAD

if [ -d "build/compat-table" ]; then
  cd build/compat-table
  commit="$(git rev-parse HEAD)"
  cd ../..

  if [ $commit == $COMPAT_TABLE_COMMIT ]; then
    exit 0
  fi
fi

rm -rf build/compat-table
mkdir -p build
git clone --single-branch --shallow-since=2020-04-01 https://github.com/kangax/compat-table.git build/compat-table
cd build/compat-table && git checkout -q $COMPAT_TABLE_COMMIT
