dtmc

const double p;
const double r1;
const double r2;

system
        "S1" || "S2" || "S3"
endsystem

system "S1"
        PIN1
endsystem

system "S2"
        PIN2
endsystem

system "S3"
        PIN3
endsystem

module PIN1

s : [0..1] init 0;

[]s=0->p:(s'=0)+(1-p):(s'=1);

endmodule

module PIN2

t : [0..1] init 0;

[]t=0->p:(t'=0)+(1-p):(t'=1);

endmodule

module PIN3

u : [0..1] init 0;

[]u=0->p:(u'=0)+(1-p):(u'=1);

endmodule

rewards "impact"
  s=0: r1;
  s=1: r2;
  t=0: r1;
  t=1: r2;
  u=0: r1;
  u=1: r2;
endrewards
