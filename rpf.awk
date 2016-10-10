/\$optim\$bestmem/ {
	mem = 1
}
/\$optim\$bestval/ {
	best=1
	mem = 0
}
/\$optim\$nfeval/ {
	best=0
}
{
	if (mem)
		print $0
	if (best)
		print $0
}
