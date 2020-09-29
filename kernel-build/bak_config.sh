#!/bin/bash

bak_dir="/usr/src/build"

lqx_dir="/usr/src/linux-5.8.12-pf2"
pf_dir="/usr/src/linux-5.8_p6-pf"
xanmod_dir="/usr/src/linux-5.8.12-xanmod"
zen_dir="/usr/src/linux-5.8.12-zen"
git_dir="/usr/src/linux-5.9-rc7"

echo "backing up lqx config..."
if [ -d ${lqx_dir} ]; then
   cat ${lqx_dir}/.config > ${bak_dir}/config_lqx
else
   echo "lqx dir not found, skipping..."
fi


echo "backing up pf config..."
if [ -d ${pf_dir} ]; then
   cat ${pf_dir}/.config > ${bak_dir}/config_pf
else
   echo "pf dir not found, skipping..."
fi


echo "backing up xanmod config..."
if [ -d ${xanmod_dir} ]; then
   cat ${xanmod_dir}/.config > ${bak_dir}/config_xanmod
else
   echo "xanmod dir not found, skipping..."
fi

echo "backing up zen config..."
if [ -d ${zen_dir} ]; then
   cat ${zen_dir}/.config > ${bak_dir}/config_zen
else
   echo "zen dir not found, skipping..."
fi

echo "backing up git config..."
if [ -d ${git_dir} ]; then
   cat ${git_dir}/.config > ${bak_dir}/config_git
else
   echo "git dir not found, skipping..."
fi
