dtmc

const double p1 = 0.1;
const double p11 = 0.1;
const double p12 = 0.1;
const double i00 = 1;
const double i11 = 1;
const double i1 = 1;

module ROOM

// 0 - locked; 1 - unlocked; 2 - exit; p1 - lock; 1-p1 - unlock
r : [0..2] init 0;

[]r=0->p1:(r'=0)+p11:(r'=1)+(1-p1-p11):(r'=2);
[]r=1->p1:(r'=0)+p12:(r'=1)+(1-p1-p12):(r'=2);

endmodule

rewards "impact"
  r=0: i00;
  r=1: i11;
  r=2: i1;
endrewards
