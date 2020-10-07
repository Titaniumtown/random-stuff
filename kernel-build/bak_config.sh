#!/bin/bash

bak_dir="/usr/src/build"

lqx_dir="/usr/src/linux-5.8.14-liquorix"

echo "backing up lqx config..."
if [ -d ${lqx_dir} ]; then
   cat ${lqx_dir}/.config > ${bak_dir}/config_lqx
else
   echo "lqx dir not found, skipping..."
fi

