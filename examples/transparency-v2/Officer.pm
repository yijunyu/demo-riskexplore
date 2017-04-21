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
