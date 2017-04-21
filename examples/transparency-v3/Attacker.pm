dtmc

const double pa1 = 0.1;
const double pa2 = 0.1;
const double ia0 = 1;
const double ia1 = 1;
const double ia2 = 1;

module ATTACKER

// 0 - out of office; 1 - inside office; 2 - exit
a : [0..2] init 0;

[]a=0->pa1:(a'=1)+(1-pa1):(a'=2);
[]a=1->pa2:(a'=0)+(1-pa2):(a'=2);

endmodule

rewards "attacker_impact"
  a=0: ia0;
  a=1: ia1;
  a=2: ia2;
endrewards
