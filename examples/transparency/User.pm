dtmc

const double p_u1 = 0.1;
const double i_u1 = 1;
const double i_u2 = 1;

module USER

# 0 enter inside 1 leave outside
s : [0..1] init 0;

[]s=0->p_u1:(s'=0)+(1-p_u1):(s'=1);
[]s=1->p_u2:(s'=0)+(1-p_u2):(s'=1);

endmodule

rewards "impact"
  s=0: i_u1;
  s=1: i_u2;
endrewards
