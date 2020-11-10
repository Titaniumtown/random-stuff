#!/bin/bash

bak_dir="/usr/src/build"

git_dir="/usr/src/linux-5.10-rc3"
pf_dir="/usr/src/linux-5.9_p2-pf"
ck_dir="/usr/src/linux-5.9.3-ck"
mainline_dir="/usr/src/linux-mainline"

echo "backing up git config..."
if [ -d ${git_dir} ]; then
   if [ -f "${git_dir}/.config" ]; then
      cat ${git_dir}/.config > ${bak_dir}/config_git
   else
      echo "git config not found, skipping..."
   fi
else
   echo "git dir not found, skipping..."
fi

echo "backing up pf config..."
if [ -d ${pf_dir} ]; then
   if [ -f "${pf_dir}/.config" ]; then
      cat ${pf_dir}/.config > ${bak_dir}/config_pf
   else
      echo "pf config not found, skipping..."
   fi
else
   echo "pf dir not found, skipping..."
fi

echo "backing up ck config..."
if [ -d ${ck_dir} ]; then
   if [ -f "${ck_dir}/.config" ]; then
      cat ${ck_dir}/.config > ${bak_dir}/config_ck
   else
      echo "ck config not found, skipping..."
   fi
else
   echo "ck dir not found, skipping..."
fi

echo "backing up mainline config..."
if [ -d ${mainline_dir} ]; then
   if [ -f "${mainline_dir}/.config" ]; then
      cat ${mainline_dir}/.config > ${bak_dir}/config_mainline
   else
      echo "mainline config not found, skipping..."
   fi
else
   echo "mainline dir not found, skipping..."
fi
