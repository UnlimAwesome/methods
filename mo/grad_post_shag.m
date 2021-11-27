syms x1 x2 x g(x);
g(x)=0;
fname(x1,x2)=x1^2+x2^2+x1+x2;
alpha = 0.001;
lambda=0.8;
X0=[g(x);g(x)];
e=0.001;
XOld=X0;
subX=XOld;
i=1;
sup=0;
GR=grad(fname,subX(1),subX(2));
L=abs(sqrt(subs(GR(1),x1,subX(1))^2+subs(GR(2),x2,subX(2))^2))/abs(subX(1)^2-subX(2)^2);
disp(L)
% alpha=(1-e)/L+e
while (1-e)/alpha<=abs(sqrt(subs(GR(1),x1,subX(1))^2+subs(GR(2),x2,subX(2))^2))/abs(subX(1)^2-subX(2)^2)   
      
      XNew(1)=subX(1)-alpha*subs(GR(1),x1,subX(1));
      XNew(2)=subX(2)-alpha*subs(GR(2),x2,subX(2));
      i=i+1;
      GR=grad(fname,XNew(1),XNew(2));
      subX=XNew  
end
disp('Result')
disp(XNew)