dtmc

const double pr1 = 0.1;
const double pr2 = 0.1;
const double ir0 = 1;
const double ir1 = 1;
const double ir2 = 1;

module ROOM

// 0 - locked; 1 - unlocked; 2 - exit
r : [0..2] init 0;

[]r=0->pr1:(r'=1)+(1-pr1):(r'=2);
[]r=1->pr2:(r'=0)+(1-pr2):(r'=2);

endmodule

rewards "room_impact"
  r=0: ir0;
  r=1: ir1;
  r=2: ir2;
endrewards
dtmc

const double pu1 = 0.1;
const double pu2 = 0.1;
const double iu0 = 1;
const double iu1 = 1;
const double iu2 = 1;

module USER

// 0 - out of office; 1 - inside office; 2 - exit
u : [0..2] init 0;

[]u=0->pu1:(u'=1)+(1-pu1):(u'=2);
[]u=1->pu2:(u'=0)+(1-pu2):(u'=2);

endmodule

rewards "user_impact"
  u=0: iu0;
  u=1: iu1;
  u=2: iu2;
endrewards
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
dtmc

const double po1 = 0.1;
const double po2 = 0.1;
const double io0 = 1;
const double io1 = 1;
const double io2 = 1;

module OFFICER

// 0 - out of office; 1 - inside office; 2 - exit
o : [0..2] init 0;

[]o=0->po1:(o'=1)+(1-po1):(o'=2);
[]o=1->po2:(o'=0)+(1-po2):(o'=2);

endmodule

rewards "officer_impact"
  o=0: io0;
  o=1: io1;
  o=2: io2;
endrewards
