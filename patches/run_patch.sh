#!/bin/bash

shopt -s globstar

# Run from inside repo/patch directory
echo The following patches are available:
echo
# pushd ../
# find ./ -type f -name '*.patch' -print0 | sort -z | xargs --null -i echo {}
find ./ -type f -name '*.patch' -print0 | sort -z | xargs --null -i -n1 bash -c 'echo $1 "<---" $1' sh {} | sed -r 's/\.([a-z|0-9]{7}\.patch)//' | sed -r 's/\.\///g'

echo
echo

find ./ -type f -name '*.patch' -print0 | sort -z | xargs --null -i -n1 bash -c 'echo ${1} -i ${1}' sh {} | sed -r 's/\.([a-z|0-9]{7}\.patch)//' | sed -r 's/\.\///g' | sed 's/^/..\//' | awk '{print $1" "$2" "$3}' | xargs -t -I{} -n3 patch --verbose -lbu

# patch -lbu

# patch -lbu
