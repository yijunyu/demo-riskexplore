dtmc

const double p2 = 0.1;
const double p21 = 0.1;
const double p22 = 0.1;
const double iu0 = 1;
const double iu1 = 1;
const double iu2 = 1;

module USER

// 0 - out of office; 1 - inside office; 2 - exit
u : [0..2] init 0;

[]u=0->p2:(u'=0)+(1-p2-p21):(u'=1)+p21:(u'=2);
[]u=1->p2:(u'=0)+(1-p2-p22):(u'=1)+p22:(u'=2);

endmodule

rewards "user_impact"
  u=0: iu0;
  u=1: iu1;
  u=2: iu2;
endrewards
