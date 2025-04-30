#!/bin/sh
./test $@ | xxd
./test $@ | nc 10.204.248.176 -w 1 1337 | xxd
