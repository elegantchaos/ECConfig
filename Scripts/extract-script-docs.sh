#!/usr/bin/env bash

file=$1
comments=`grep "##" "$file"`

pattern="## ([a-z]*).git@github.com:([a-zA-Z0-9]+)\/"
[[ $comments =~ $pattern ]]
githubrepo=${BASH_REMATCH[1]}
githubuser=${BASH_REMATCH[2]}

base=`basename "$file" ".sh"`

echo "${comments//##/}" > "$base-template.md"
