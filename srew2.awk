/^ *s=/ {
	split($0, a, /:/)
	split(a[1], b, /s=/)
	state=b[2]
	split(a[2], c, /;/)
	impact=c[1]
	print impact "<-1"
}
END {
}
