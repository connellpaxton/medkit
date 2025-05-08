#!/bin/sh
./test $@ | xxd
./test $@ | nc 192.168.154.97 -w 1 1337 | xxd
