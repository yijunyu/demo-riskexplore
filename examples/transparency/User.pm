dtmc

const double pu1 = 0.1;
const double iu1 = 1;
const double iu2 = 1;

module USER

s : [0..1] init 0;

[]s=0->pu1:(s'=0)+(1-pu1):(s'=1);

endmodule

rewards "impact"
  s=0: iu1;
  s=1: iu2;
endrewards
