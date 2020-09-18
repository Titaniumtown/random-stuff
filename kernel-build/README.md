## My kernel build script (and .config)
Just a small script I made to compile the kernel with gcc 10, O3, native, graphite, and LTO. There is a clang option, DON'T USE IT. Clang doesn't seem to want to compile the kernel (in my testing) with any sort of LTO, and polly isn't officially packaged in the gentoo ebuild repos.

Just a note: don't use my .config lol, it doesn't have all the drivers you probably need (I tried to make it as small as possible)