dtmc

const double a;
const double b;
const double c;
const double d;
const double e;
const double f;
const double g;
const double h;
const double i;
const double j;
const double k;

module die

s : [0..8] init 0;

[] s=0 -> a : (s'=1);
[] s=1 -> h : (s'=8) + b : (s'=2)  + (1-b-h) : (s'=5);
[] s=2 -> i : (s'=8) + c : (s'=3)  + (1-c-i) : (s'=6);
[] s=3 -> j : (s'=8) + d : (s'=4)  + (1-d-j) : (s'=7);
[] s=4 -> k : (s'=8);
[] s=5 -> e : (s'=6) + (1-e) : (s'=8);
[] s=6 -> f : (s'=7) + (1-f) : (s'=8);
[] s=7 -> l : (s'=8);
[] s=8 -> g : (s'=8);

endmodule

rewards "impact"
  s=1: i1;
  s=2: i2;
  s=3: i4;
  s=4: i5;
  s=5: i6;
  s=6: i7;
  s=7: i8;
  s=8: i9;
  
endrewards
