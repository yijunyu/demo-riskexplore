dtmc

const double pb;
const double pc;
const double pd;
const double pe;
const double pf;
const double ph;
const double pi;
const double pj;
const double i1;
const double i2;
const double i3;
const double i4;
const double i5;
const double i6;
const double i7;
const double i8;

module die

s : [0..8] init 0;

[] s=0 -> 1.0 : (s'=1);
[] s=1 -> ph : (s'=8) + pb : (s'=2)  + (1-pb-ph) : (s'=5);
[] s=2 -> pi : (s'=8) + pc : (s'=3)  + (1-pc-pi) : (s'=6);
[] s=3 -> pj : (s'=8) + pd : (s'=4)  + (1-pd-pj) : (s'=7);
[] s=4 -> 1.0 : (s'=8);
[] s=5 -> pe : (s'=6) + (1-pe) : (s'=8);
[] s=6 -> pf : (s'=7) + (1-pf) : (s'=8);
[] s=7 -> 1.0 : (s'=8);

endmodule

rewards "impact"
  s=1: i1;
  s=2: i2;
  s=3: i3;
  s=4: i4;
  s=5: i5;
  s=6: i6;
  s=7: i7;
  s=8: i8;
endrewards
