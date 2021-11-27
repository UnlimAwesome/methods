function GR=grad(fname,a,b)
syms fname(x1, x2)
fname(x1,x2)=x1^2+x2^2+x1+x2;
GR=[];
GR(1)=subs(diff(fname,x1),x1,a);
GR(2)=subs(diff(fname,x2),x2,b);