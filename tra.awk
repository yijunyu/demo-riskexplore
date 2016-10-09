/\[\]s=/ {
	split($0, a, /->/)
	split(a[1],b,/=/)
	n = split(a[2],c,/+/)
	from=b[2]
	x++;
	for (i=1; i<=n; i++) {
		split(c[i], d, /:/)
		prob = d[1];
		split(d[2], e, /=/);
		split(e[2], f, /)/);
		to = f[1];
		lines = lines "\n" from " " to " " prob
		y++;
	}
}
END {
	print (x+1) " " (y+1) lines
}
