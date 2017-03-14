dtmc

const double po1=0.1;
const double po2=0.1;
const double i3=100;
const double i4=1000;

module OFFICE

s : [0..1] init 0;

[]s=0->po1:(s'=0)+(1-po1):(s'=1);

endmodule

rewards "impact"
  s=0: i3;
  s=1: i4;
endrewards
