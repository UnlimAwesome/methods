% 17.277
% f(x)=x1^2+x2^2-4x1-6x2
% A(0;0) B(0;4) C(5;8) D(10;4) E(6;0)
% x1>=0
% x2>=0
% x2<=4/5*x1+4
% x2<=-4/5*x1+12
% x2>=x1-6
%answ (2;3) -13
syms x1 x2 positive;
syms l1 l2 l3 l4 l5;
fname(x1,x2)=x1^2+x2^2-4*x1-6*x2;
g1=x1;
g2=x2;
g3=x2-4/5*x1-4;
g4=x2+4/5*x1-12;
g5=x2-x1+6;
L1=diff(fname,x2)+l1*diff(g1,x2)+l2*diff(g2,x2)+l3*diff(g3,x2)+l4*diff(g4,x2)+l5*diff(g5,x2)==0;
L2=diff(fname,x1)+l1*diff(g1,x1)+l2*diff(g2,x1)+l3*diff(g3,x1)+l4*diff(g4,x1)+l5*diff(g5,x1)==0;
L3=l1*g1==0;
L4=l2*g2==0;
L5=l3*g3==0;
L6=l4*g4==0;
L7=l5*g5==0;
L8=x1>0;
L9=x2>0;
L10=x2<4/5*x1+4;
L11=x2<-4/5*x1+12;
L12=x2>x1-6;
eqns=[L1 L2 L3 L4 L5 L6 L7 L8 L9 L10 L11 L12];
vars=[x1 x2 l1 l2 l3 l4 l5];
[answx1, answx2, answl1, answl2, answl3, answl4, answl5,params,conds]=solve (eqns, vars, 'MaxDegree', 4, 'ReturnConditions', true, 'IgnoreAnalyticConstraints', true);
disp (answx1');
disp (answx2');
