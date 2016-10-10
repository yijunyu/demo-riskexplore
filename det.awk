/</{
	n = split($0, a, /And /)
	for (i=1;i<=n;i++) {
		split(a[i], b, /</)
		print "\tif (" b[2] "<=0) return(Inf)"
	}
}
