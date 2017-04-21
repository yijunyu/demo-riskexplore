dtmc

const double p3 = 0.1;
const double p31 = 0.1;
const double p32 = 0.1;
const double ia0 = 1;
const double ia1 = 1;
const double ia2 = 1;

module ATTACKER

// 0 - out of office; 1 - inside office; 2 - exit
a : [0..2] init 0;

[]a=0->p3:(a'=0)+(1-p3-p31):(a'=1)+p31:(a'=2);
[]a=1->p3:(a'=0)+(1-p3-p32):(a'=1)+p32:(a'=2);

endmodule

rewards "attacker_impact"
  a=0: ia0;
  a=1: ia1;
  a=2: ia2;
endrewards
