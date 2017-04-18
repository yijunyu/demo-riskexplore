dtmc

const double p2 = 0.1;
const double i00 = 1;
const double i01 = 1;

module USER

// 0 - out of office; 1 - inside office; 1-p2 - enter; p2 - leave

u : [0..1] init 0;

[]u=0->p2:(u'=0)+(1-p2):(u'=1);
[]u=1->p2:(u'=0)+(1-p2):(u'=1);

endmodule

rewards "impact"
  u=0: i00;
  u=1: i01;
endrewards
