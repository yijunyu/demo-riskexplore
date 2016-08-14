dtmc

module die

s : [0..3] init 0;

[] s=0 -> 1 : (s'=1);
[] s=1 -> 0.2 : (s'=0) + 0.8 : (s'=2);
[] s=2 -> 0.2 : (s'=3) + 0.8 : (s'=1);
endmodule
