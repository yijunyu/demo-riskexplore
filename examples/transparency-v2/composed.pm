dtmc

const double p1 = 0.1;
const double p11 = 0.1;
const double p12 = 0.1;
const double ir0 = 1;
const double ir1 = 1;
const double ir2 = 1;

module ROOM

// 0 - locked; 1 - unlocked; 2 - exit; p1 - lock; 1-p1 - unlock
r : [0..2] init 0;

[]r=0->p1:(r'=0)+p11:(r'=1)+(1-p1-p11):(r'=2);
[]r=1->p1:(r'=0)+p12:(r'=1)+(1-p1-p12):(r'=2);

endmodule

rewards "impact"
  r=0: ir0;
  r=1: ir1;
  r=2: ir2;
endrewards
dtmc

const double p2 = 0.1;
const double p21 = 0.1;
const double p22 = 0.1;
const double iu0 = 1;
const double iu1 = 1;
const double iu2 = 1;

module USER

// 0 - out of office; 1 - inside office; 2 - exit; 1-p2 - enter; p2 - leave

u : [0..2] init 0;

[]u=0->p2:(u'=0)+p21:(u'=1)+(1-p2-p21):(u'=2);
[]u=1->p2:(u'=0)+p22:(u'=1)+(1-p2-p22):(u'=2);

endmodule

rewards "impact"
  u=0: iu0;
  u=1: iu1;
  u=2: iu2;
endrewards
dtmc

const double p4 = 0.1;
const double p41 = 0.1;
const double p42 = 0.1;
const double io0 = 1;
const double io1 = 1;
const double io2 = 1;

module OFFICER

// 0 - out of office; 1 - inside office; 2 - exit
o : [0..2] init 0;

[]o=0->p4:(o'=0)+(1-p4-p41):(o'=1)+p41:(o'=2);
[]o=1->p4:(o'=0)+(1-p4-p42):(o'=1)+p42:(o'=2);

endmodule

rewards "officer_impact"
  o=0: io0;
  o=1: io1;
  o=2: io2;
endrewards
