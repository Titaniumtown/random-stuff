#!/bin/bash

bak_dir="/usr/src/build"

lqx_dir="/usr/src/linux-5.8.14-liquorix"
linux_clang_lto_dir="/usr/src/linux-clang-lto"

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

echo "backing up linux-clang-lto config..."
if [ -d ${linux_clang_lto_dir} ]; then
   if [ -f "${linux_clang_lto_dir}/.config" ]; then
      cat ${linux_clang_lto_dir}/.config > ${bak_dir}/config_linux_clang_lto
   else
      echo "linux-clang-lto config not found, skipping..."
   fi
else
   echo "linux-clang-lto dir not found, skipping..."
fi
