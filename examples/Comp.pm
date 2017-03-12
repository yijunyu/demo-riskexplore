dtmc

const double p = 0.1;
const double r1 = 1;
const double r2 = 1;
const double r3 = 1;
const double r4 = 1;

system
        "S1" || "S2"
endsystem

system "S1"
        PIN
endsystem

system "S2"
        PIN2
endsystem

module PIN

s : [0..1] init 0;

[]s=0->p:(s'=0)+(1-p):(s'=1);

endmodule

module PIN2

t : [0..1] init 0;

[]t=0->p:(t'=0)+(1-p):(t'=1);

endmodule

rewards "impact"
  s=0: r1;
  s=1: r2;
  t=0: r3;
  t=1: r4;
endrewards
