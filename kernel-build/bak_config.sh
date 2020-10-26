#!/bin/bash

bak_dir="/usr/src/build"

lqx_dir="/usr/src/linux-5.8.16-pf1"
pf_dir="/usr/src/linux-5.9_p1-pf"
ck_dir="/usr/src/linux-5.9.1-ck"

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
