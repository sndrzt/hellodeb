#!/usr/bin/env bash

/usr/lib/gcc/aarch64-linux-gnu/9/cc1 -o hello.i -E hello.c
/usr/lib/gcc/aarch64-linux-gnu/9/cc1 -o hello.s hello.i
/usr/lib/gcc/aarch64-linux-gnu/9/cc1 -o hello.o hello.s
/usr/bin/as -o hello.o hello.s
ld -o hello hello.o /usr/lib/aarch64-linux-gnu/crt1.o /usr/lib/aarch64-linux-gnu/crti.o /usr/lib/aarch64-linux-gnu/crtn.o -lc

