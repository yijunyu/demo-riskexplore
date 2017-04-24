dtmc

const double p1 = 0.1;
const double p2 = 0.1;
const double ir0 = 1;
const double ir1 = 1;
const double ir2 = 1;
const double iu0 = 1;
const double iu1 = 1;
const double iu2 = 1;

module ROOM

s: [0..9] init 0;

[]s=0->((1-p2)/2):(s'=1)+    (p2/2):(s'=2)+((1-p1)/2):(s'=3)+    (p1/2):(s'=6);
[]s=1->    (p2/2):(s'=0)+((1-p2)/2):(s'=2)+((1-p1)/2):(s'=5)+    (p1/2):(s'=7);
[]s=2->    (1-p1):(s'=5)+        p1:(s'=8);
[]s=3->    (p1/2):(s'=0)+((1-p2)/2):(s'=4)+    (p2/2):(s'=5)+((1-p1)/2):(s'=6);
[]s=4->    (p1/2):(s'=1)+    (p2/2):(s'=3)+((1-p2)/2):(s'=5)+((1-p1)/2):(s'=7);
[]s=5->        p1:(s'=3)+    (1-p1):(s'=8);
[]s=6->    (1-p2):(s'=7)+        p2:(s'=8);
[]s=7->        p2:(s'=6)+    (1-p2):(s'=8);

endmodule

rewards "room_impact"
  s=0: (ir0+iu0);
  s=1: (ir0+iu1);
  s=2: (ir0+iu2);
  s=3: (ir1+iu0);
  s=4: (ir1+iu1);
  s=5: (ir1+iu2);
  s=6: (ir2+iu0);
  s=7: (ir2+iu1);
  s=8: (ir2+iu2);
endrewards
