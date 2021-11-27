syms x1 x2 x g(x) ;
syms fname(x1, x2);
% fname(x1,x2)=x1^2+x2^2+x1+x2;
g(x)=0;
alpha = 0.1;
lambda=0.8;
X0=[g(x);g(x)];
e=0.001;
% f=x1^2+x2^2+x1+x2;
XOld=X0;
GR=grad(fname,XOld(1),XOld(2)); 
XNew=XOld;
p=0;
while sqrt(GR(1)^2+GR(2)^2)>e
    subX=XOld;
    subX(1)=XNew(1)-alpha*subs(GR(1),x1,XNew(1));
    subX(2)=XNew(2)-alpha*subs(GR(2),x2,XNew(2));
    GR=grad(fname,XNew(1),XNew(2));
    while vec2fun(subX)-vec2fun(XOld)>-alpha*sqrt(GR(1)^2+GR(2)^2)
    alpha=alpha*lambda;
    subX(1)=XNew(1)-alpha*subs(GR(1),x1,XNew(1));
    subX(2)=XNew(2)-alpha*subs(GR(2),x2,XNew(2));
    end
XNew=subX;
GR=grad(fname,XNew(1),XNew(2));
disp (subX)
end
disp('Answer')
disp (XNew)