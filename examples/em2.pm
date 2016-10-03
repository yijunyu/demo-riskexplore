dtmc
const double p01;
const double p02;
const double p08;
const double p13;
const double p23;
const double p25;
const double p30;
const double p31;
const double p32;
const double p56;
const double p67;
const double p73;
const double p80;
const double p98;
const double p910;
const double p1011;
const double p114;

module die

s : [0..11] init 0;

[]s=0->(1-p01-p02-p08):(s'=0)+p01:(s'=1)+p02:(s'=2)+p08:(s'=8);
[]s=1->(1-p13):(s'=0)+p13:(s'=3);
[]s=2->(1-p23-p25):(s'=0)+p23:(s'=3)+p25:(s'=5);
[]s=3->p30:(s'=0)+p31:(s'=1)+p32:(s'=2)+(1-p30-p31-p32):(s'=4);
[]s=5->(1-p56):(s'=2)+p56:(s'=6);
[]s=6->(1-p67):(s'=5)+p67:(s'=7);
[]s=7->p73:(s'=3);
[]s=8->p80:(s'=0)+(1-p80):(s'=9);
[]s=9->p98:(s'=8)+p910:(s'=10)+(1-p98-p910):(s'=11);
[]s=10->(1-p1011):(s'=9)+p1011:(s'=11);
[]s=11->p114:(s'=4);

endmodule

rewards "impact"
  s=1: 0;
  s=2: 6;
  s=3: 3;
  s=4: 3;
  s=5: 3;
  s=6: 3;
  s=7: 0;
  s=8: 3;
  s=9: 6;
  s=10: 3;
  s=11: 9;
endrewards
