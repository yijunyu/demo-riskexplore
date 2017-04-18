dtmc

const double p2 = 0.1;
const double p21 = 0.1;
const double p22 = 0.1;
const double i01 = 1;
const double i10 = 1;
const double i2 = 1;

module USER

// 0 - out of office; 1 - inside office; 2 - exit; 1-p2 - enter; p2 - leave

u : [0..2] init 0;

[]u=0->p2:(u'=0)+p21:(u'=1)+(1-p2-p21):(u'=2);
[]u=1->p2:(u'=0)+p22:(u'=1)+(1-p2-p22):(u'=2);

endmodule

rewards "impact"
  u=0: i01;
  u=1: i10;
  u=2: i2;
endrewards
