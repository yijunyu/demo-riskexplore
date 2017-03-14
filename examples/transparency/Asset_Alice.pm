dtmc

const double p_a0;
const double p_a1;
const double p_a2;
const double p_a3;
const double p_a4;
const double p_a5;
const double v1;
const double v2;

module ASSET

s : [0..2] init 0;

[]s=0->p_a0:(s'=0)+p_a1:(s'=1)+(1-p_a0-p_a1):(s'=2);
[]s=1->p_a2:(s'=0)+p_a3:(s'=1)+(1-p_a2-p_a3):(s'=2);
[]s=2->p_a4:(s'=0)+p_a5:(s'=1)+(1-p_a4-p_a5):(s'=2);

endmodule

rewards "impact"
  s=0: 0;
  s=1: v1;
  s=2: v2;
endrewards
