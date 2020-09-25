#!/bin/bash

#compiler="gcc"
compiler="clang"

NTHREADS="8"

GCC_CC="gcc"
GCC_CXX="g++"

#basic O3 and native
GCC_FLAGS="-O3 -march=native -mtune=native"
#graphite
GCC_FLAGS="${GCC_FLAGS} -falign-functions=32 -fipa-pta -fno-semantic-interposition -fgraphite-identity -floop-nest-optimize -ffat-lto-objects"
#lto
GCC_FLAGS="${GCC_FLAGS} -flto=${NTHREADS}"
#safe fast math
GCC_FLAGS="${GCC_FLAGS} -fno-math-errno -fno-trapping-math -fdevirtualize-at-ltrans"
GCC_AR=gcc-ar
GCC_NM=gcc-nm



#I also live on the edge
CLANG_CC="clang"
CLANG_CXX="clang++"

#basic O3 and native
CLANG_FLAGS="-O3 -march=native -mtune=native"
#clang+lto fails (even on clang 10)
#CLANG_FLAGS="${CLANG_FLAGS} -flto=thin"
#polly (see: https://forums.gentoo.org/viewtopic-t-1114740-start-0.html)
CLANG_FLAGS="${CLANG_FLAGS} -mllvm -polly"
CLANG_AR=llvm-ar
CLANG_NM=llvm-nm

LD="ld.bfd"

if [ ${compiler} == "clang" ]; then
	CC="${CLANG_CC}"
	CXX="${CLANG_CXX}"
	FLAGS="${CLANG_FLAGS}"
	NM="${CLANG_NM}"
	AR="${CLANG_AR}"
	LLVM_OPT="1"
elif [ ${compiler} == "gcc" ]; then
	CC="${GCC_CC}"
	CXX="${GCC_CXX}"
	FLAGS="${GCC_FLAGS}"
       	NM="${GCC_NM}"
       	AR="${GCC_AR}"
	LLVM_OPT="0"
fi


time make LLVM="${LLVM_OPT}" NM="${NM}" AR="${AR}" LD="${LD}" HOSTCC="${CC}" CC="${CC}" CXX="${CXX}" KCFLAGS="${FLAGS}" KCXXFLAGS="${FLAGS}" KLDFLAGS="${FLAGS}" -j"${NTHREADS}" menuconfig
time make LLVM="${LLVM_OPT}" NM="${NM}" AR="${AR}" LD="${LD}" HOSTCC="${CC}" CC="${CC}" CXX="${CXX}" KCFLAGS="${FLAGS}" KCXXFLAGS="${FLAGS}" KLDFLAGS="${FLAGS}" -j"${NTHREADS}"
time make LLVM="${LLVM_OPT}" NM="${NM}" AR="${AR}" LD="${LD}" HOSTCC="${CC}" CC="${CC}" CXX="${CXX}" KCFLAGS="${FLAGS}" KCXXFLAGS="${FLAGS}" KLDFLAGS="${FLAGS}" -j"${NTHREADS}" modules


time make LLVM="${LLVM_OPT}" NM="${NM}" AR="${AR}" LD="${LD}" HOSTCC="${CC}" CC="${CC}" CXX="${CXX}" KCFLAGS="${FLAGS}" KCXXFLAGS="${FLAGS}" KLDFLAGS="${FLAGS}" -j"${NTHREADS}" modules_install

time make LLVM="${LLVM_OPT}" NM="${NM}" AR="${AR}" LD="${LD}" HOSTCC="${CC}" CC="${CC}" CXX="${CXX}" KCFLAGS="${FLAGS}" KCXXFLAGS="${FLAGS}" KLDFLAGS="${FLAGS}" -j"${NTHREADS}" install
