dtmc

const double p1 = 0.1;
const double ir0 = 1;
const double ir1 = 1;
const double ir2 = 1;

module ROOM

// 0 - unlocked; 1 - locked; 2 - exit
r : [0..2] init 0;

[]r=0->(1-p1):(r'=1)+p1:(r'=2);
[]r=1->p1:(r'=0)+(1-p1):(r'=2);

endmodule

rewards "room_impact"
  r=0: ir0;
  r=1: ir1;
  r=2: ir2;
endrewards
