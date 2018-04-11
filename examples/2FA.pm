dtmc

const double p;
const double q;
const double i1;
const double i2;
const double i3;

module PIN

s : [0..2] init 0;

[]s=0->p:(s'=0)+(1-p):(s'=1);
[]s=1->q:(s'=1)+(1-q):(s'=2);

endmodule

rewards "impact"
  s=0: i1;
  s=1: i2;
  s=2: i3;
endrewards
