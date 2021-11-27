syms x1 x2 x g(x);
g(x)=0;
fname(x1,x2)=x1^2+x2^2+x1+x2;
alpha = 0.1;
lambda=0.8;
X0=[g(x);g(x)];
e=0.1;
XOld=X0;
subX=XOld;
i=1;
sup=0;
GR=grad(fname,subX(1),subX(2));
while sqrt(GR(1)^2+GR(2)^2)>e   
      XNew(1)=subX(1)-(1/i)*subs(GR(1),x1,subX(1));
      XNew(2)=subX(2)-(1/i)*subs(GR(2),x2,subX(2));
      i=i+1;
      GR=grad(fname,XNew(1),XNew(2));
      subX=XNew
end
disp(XNew)