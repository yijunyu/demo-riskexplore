dtmc

const double p;
const double r1;
const double r2;

module PIN

s : [0..1] init 0;

[]s=0->p:(s'=0)+(1-p):(s'=1);

endmodule

rewards "impact"
  s=0: r1;
  s=1: r2;
endrewards
