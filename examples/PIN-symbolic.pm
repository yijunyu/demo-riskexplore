dtmc

const double p;

module die

s : [0..1] init 0;

[] s=0 -> p : (s'=0) + (1-p) : (s'=1);

endmodule
