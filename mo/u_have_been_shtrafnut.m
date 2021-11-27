syms x1 x2 x ;
fname(x1,x2)=x1^2+x2^2-4*x1-6*x2;
e=0.05;
X0=[0 0];
r=1;
% syms x1 x2 positive;
% syms l1 l2 l3 l4 l5;
% fname(x1,x2)=x1^2+x2^2-4*x1-6*x2;
g1(x1,x2)=x1;
g2(x1,x2)=x2;
g3(x1,x2)=x2-4/5*x1-4;
g4(x1,x2)=x2+4/5*x1-12;
g5(x1,x2)=x2-x1+6;
% L1=diff(fname,x2)+l1*diff(g1,x2)+l2*diff(g2,x2)+l3*diff(g3,x2)+l4*diff(g4,x2)+l5*diff(g5,x2)==0;
% L2=diff(fname,x1)+l1*diff(g1,x1)+l2*diff(g2,x1)+l3*diff(g3,x1)+l4*diff(g4,x1)+l5*diff(g5,x1)==0;
% L3=l1*g1==0;
% L4=l2*g2==0;
% L5=l3*g3==0;
% L6=l4*g4==0;
% L7=l5*g5==0;
% L8=x1>0;
% L9=x2>0;
% L10=x2<4/5*x1+4;
% L11=x2<-4/5*x1+12;
% L12=x2>x1-6;
% eqns=[L1 L2 L3 L4 L5 L6 L7 L8 L9 L10 L11 L12];
% vars=[x1 x2 l1 l2 l3 l4 l5];
% [answx1, answx2, answl1, answl2, answl3, answl4, answl5,params,conds]=solve (eqns, vars, 'MaxDegree', 4, 'ReturnConditions', true, 'IgnoreAnalyticConstraints', true);
% disp (answx1');
% disp (answx2');
 XOld=X0;    
 GRf=grad(fname,XOld(1),XOld(2));
while sqrt(GRf(1)^2+GRf(2)^2)>e    
%     phi=fname+r*((max([0 g1]))^2 +(max([0 g2]))^2 +(max([0 g3]))^2 +(max([0 g4]))^2 +(max([0 g5]))^2 )
% GRf=grad(fname,XOld(1),XOld(2));
% GRg1=grad(g1,XOld(1),XOld(2));
% GRg2=grad(g2,XOld(1),XOld(2));
% GRg3=grad(g3,XOld(1),XOld(2));
% GRg4=grad(g4,XOld(1),XOld(2));
% GRg5=grad(g5,XOld(1),XOld(2));
phi_=subfun(XOld,fname,g1,g2,g3,g4,g5,r);
XNew=XOld-alpha*phi_;
eqn1= g1(XNew(1),XNew(2))>0 | g2(XNew(1),XNew(2))>0 | g3(XNew(1),XNew(2))>0 | g4(XNew(1),XNew(2))>0 | g5(XNew(1),XNew(2))>0;
eqn2=subfun(XNew,fname,g1,g2,g3,g4,g5,r)==0;


end
disp('Answer')
disp (XNew)