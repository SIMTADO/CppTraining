#!/usr/bin/sh

# GCC 14 — maître : gcc, esclaves : g++, gcov
sudo update-alternatives \
    --install /usr/bin/gcc gcc /usr/bin/gcc-14 20 \
    --slave /usr/bin/g++ g++ /usr/bin/g++-14 \
    --slave /usr/bin/gcov gcov /usr/bin/gcov-14

# GCC 15 — même structure
sudo update-alternatives \
    --install /usr/bin/gcc gcc /usr/bin/gcc-15 30 \
    --slave /usr/bin/g++ g++ /usr/bin/g++-15 \
    --slave /usr/bin/gcov gcov /usr/bin/gcov-15