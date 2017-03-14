dtmc

const double p_o1;
const double r_o1;
const double r_o2;

module OFFICE

s : [0..1] init 0;

[]s=0->p_o1:(s'=0)+(1-p_o1):(s'=1);
[]s=1->p_o2:(s'=0)+(1-p_o2):(s'=1);

endmodule

rewards "impact"
  s=0: r_o1;
  s=1: r_o2;
endrewards
