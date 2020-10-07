#!/bin/bash

bak_dir="/usr/src/build"

lqx_dir="/usr/src/linux-5.8.14-liquorix"

echo "backing up lqx config..."
if [ -d ${lqx_dir} ]; then
   if [ -f "${lqx_dir}/.config" ]; then
      cat ${lqx_dir}/.config > ${bak_dir}/config_lqx
   else
      echo "lqx config not found, skipping..."
   fi
else
   echo "lqx dir not found, skipping..."
fi

