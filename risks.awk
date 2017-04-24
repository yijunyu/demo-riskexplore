BEGIN {
  print "if(!require(\"DEoptim\")){";
  print "\tinstall.packages(\"DEoptim\", repos=\"http://cran.us.r-project.org\")"
  print "}"
  print "library(\"DEoptim\")"
  #system("awk -f srew2.awk " file ".srew")
  print "rpf <- function(prob) {"
  system("awk -f tra2.awk " file ".pm")
  system("awk -f det.awk " file ".det")
}
{
  print "\treturn (" $0 ")"
}
END {
 print "}"
 print "set.seed(1234)"
 printf("DEoptim(rpf,lower=c(")
 system("grep \"const double \" " file ".pm > /tmp/t.t")
 while (getline line  < "/tmp/t.t")
	 n++;
 for (i=1;i<=n-1;i++) printf("0,")
	 printf("0" CONST "),upper=c(")
 for (i=1;i<=n-1;i++) printf("1,")
	 print("1" CONST "), control=list(storepopfrom=0, trace=FALSE))")
}
