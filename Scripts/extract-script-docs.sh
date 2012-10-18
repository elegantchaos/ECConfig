#!/usr/bin/env bash

## Extract any comments prefixed with "##" (like this one) in a file, and write them out to
## a -template.md for inclusion in an appledoc documentation bundle.

output=$1
mkdir -p "$output"

shift

while :; do
	file=$1
	if [[ "$file" == "" ]]; then
		break
	fi
	
	shift
 
	comments=`grep "^##" "$file"`

	[[ $comments =~ $pattern ]]
	githubrepo=${BASH_REMATCH[1]}
	githubuser=${BASH_REMATCH[2]}

	base=`basename "$file"`
	name=${base%.*}

	echo "${comments//##/}" > "$output/$base-template.md"
done