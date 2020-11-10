#!/bin/bash
find ./* -maxdepth 0 -type d | while read i; do
   ofiles=$(find $i -name "*.o")
   if [ "${ofiles}" != "" ]; then
      output=$(find $i -name "*.o" -exec du -ck {} + | grep "total" | tr -d "[:blank:]" | sed -e 's/total//g' && echo -e "${i}")
      echo $output | tr -d "[:blank:]"
   fi
done
