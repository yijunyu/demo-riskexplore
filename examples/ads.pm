dtmc
const double pfree;
const double pbanner;
const double pinterstitial;
const double Premium;
const double Impression;
const double Click;

module ads

s : [0..6] init 0;

[]s=0->pfree:(s'=1)+(1-pfree):(s'=2);
[]s=1->1.0:(s'=3);
[]s=2->1.0:(s'=4);
[]s=3->pbanner:(s'=5)+(1-pbanner):(s'=6);
[]s=5->1.0:(s'=1);
[]s=6->pinterstitial:(s'=5)+(1-pinterstitial):(s'=4);

endmodule

rewards "impact"
  s=2: Premium;
  s=3: Impression;
  s=5: Click;
endrewards
