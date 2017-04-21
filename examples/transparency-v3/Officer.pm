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
