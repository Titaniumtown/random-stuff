#!/bin/bash
cd /usr/src/
ls | sort | grep -v "build" | grep "5.\|clang\|mainline" | grep -v "bak\|zfs-fixes" | sort | while read i; do
   cp -v build/build.sh $i/
   cp -v build/clean.sh $i/
done

cd /usr/src/build
bash bak_config.sh
