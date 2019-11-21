dtmc
const double p1;
const double p2;
const double p3;
const double check;
const double btc;
const double nbtc;
const double allbtc;

module free_btc
s: [0..3] init 0;
[]s=0->(1-p1):(s'=0)+p1:(s'=1);
[]s=1->(1-p2-p3):(s'=1)+p2:(s'=3)+p3:(s'=2);
[]s=2->(1-p1):(s'=0)+p1:(s'=1);
endmodule

rewards "value"
  s=0: check;
  s=1: btc;
  s=2: nbtc;
  s=3: allbtc;
endrewards
