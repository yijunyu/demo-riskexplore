dtmc

const double b;
const double c;
const double d;
const double e;
const double f;
const double h;
const double i;
const double j;
const double i1;
const double i2;
const double i3;
const double i4;
const double i5;
const double i6;
const double i7;

module die

s : [0..8] init 0;

[] s=0 -> 1.0 : (s'=1);
[] s=1 -> h : (s'=8) + b : (s'=2)  + (1-b-h) : (s'=5);
[] s=2 -> i : (s'=8) + c : (s'=3)  + (1-c-i) : (s'=6);
[] s=3 -> j : (s'=8) + d : (s'=4)  + (1-d-j) : (s'=7);
[] s=4 -> 1.0 : (s'=8);
[] s=5 -> e : (s'=6) + (1-e) : (s'=8);
[] s=6 -> f : (s'=7) + (1-f) : (s'=8);
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
