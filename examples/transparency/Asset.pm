dtmc

const double pa0 = 0.2;
const double pa1 = 0.2;
const double pa2 = 0.2;
const double pa3 = 0.2;
const double i1 = 100;
const double i2 = 1000;

module ASSET

s : [0..2] init 0;

[]s=0->pa0:(s'=0)+pa1:(s'=1)+(1-pa0-pa1):(s'=2);
[]s=1->pa2:(s'=0)+pa3:(s'=1)+(1-pa2-pa3):(s'=2);

endmodule

rewards "impact"
  s=0: 0;
  s=1: i1;
  s=2: i2;
endrewards
