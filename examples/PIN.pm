dtmc

const double p;

module PIN

s : [0..1] init 0;

[] s=0 -> p : (s'=0) + (1-p) : (s'=1);

endmodule

rewards "impact"
    s=0 : 1;
    s=1 : 100;
endrewards
