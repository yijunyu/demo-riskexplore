BEGIN{
	x = 0;
}
/const double/ {
	split($0, a, / /);
	split(a[3], b, /;/);
	print "\t" b[1] " <- prob[" ++x "]"
}
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
		print "\tif(" prob "<0) return (Inf)";
		print "\tif(" prob ">1) return (Inf)";
		y++;
	}
}
END {
}
