#!/bin/bash
cd /usr/src/
ls | sort | grep -v "build" | grep "5.\|clang\|mainline" | grep -v "bak" | sort | while read i; do
   echo "$i"
   cd "$i"
   bash clean.sh
   cd ..
done
echo "finished looping through source dirs!"

cd /usr/src/build
echo "backing up kernel configs...."
bash bak_config.sh


echo "all done!"
