dtmc
const double pseen;
const double pignore;
const double pjk;
const double puc;
const double pfc;
const double pfl;
const double preply;
const double pagain;
const double r1;
const double r3;
const double r4;
const double r5;
const double r6;
const double r7;

module die

s : [0..10] init 0;

[]s=0->pseen:(s'=1)+(1-pseen-pignore-pjk):(s'=2)+pjk:(s'=3)+pignore:(s'=10);
[]s=1->1.0:(s'=10);
[]s=2->puc:(s'=4)+pfc:(s'=5)+(1-puc-pfc-pfl):(s'=6)+pfl:(s'=7);
[]s=3->1.0:(s'=8);
[]s=4->1.0:(s'=8);
[]s=5->1.0:(s'=8);
[]s=6->1.0:(s'=8);
[]s=7->1.0:(s'=8);
[]s=8->preply:(s'=9)+(1-preply):(s'=10);
[]s=9->pagain:(s'=2)+(1-pagain):(s'=10);

endmodule

rewards "impact"
  s=1: r1;
  s=3: r3;
  s=4: r4;
  s=5: r5;
  s=6: r6;
  s=7: r7;
endrewards
