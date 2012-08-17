#!/usr/bin/env bash

base=`dirname $0`
pushd "$base" > /dev/null
full="$PWD"
popd > /dev/null

git submodule foreach "\"$full\"/grab-latest.sh"
