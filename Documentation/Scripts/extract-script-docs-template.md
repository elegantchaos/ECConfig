 Extract any comments prefixed with "" (like this one) in a file, and write them out to
 a -template.md for inclusion in an appledoc documentation bundle.
	comments=`grep "" "$file"`
	pattern=" ([a-z]*).git@github.com:([a-zA-Z0-9]+)\/"
	echo "${comments///}" > "$output/$name-template.md"
