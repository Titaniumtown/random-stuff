#!/bin/bash
cd /usr/src/
ls | sort | grep -v "build" | grep "5.\|clang\|mainline" | grep -v "bak" | sort | while read i; do
   echo "$i"
   cd "$i"
   if [[ -d ".git" ]]; then
      echo "$i has a git dir, doing git clean..."
      git clean -f -d -x --exclude="*.sh" --exclude=".config"
   else
      echo "$i doesn't have a git dir, doing bash clean.sh...."
      bash clean.sh
   fi
   cd ..
done
echo "finished looping through source dirs!"

cd /usr/src/build
echo "backing up kernel configs...."
bash bak_config.sh


echo "all done!"
