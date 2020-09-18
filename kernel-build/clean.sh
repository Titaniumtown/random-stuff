#!/bin/bash

mv -v .config .config_bak
make clean
make distclean
mv -v .config_bak .config
