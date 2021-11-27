syms x1 x2 x g(x) ;
syms fname(x1, x2);
fname(x1,x2)=x1^2+x2^2+x1+x2;
g(x)=0;
X0=[g(x);g(x)];
% disp(grad(fname,X0(1),X0(2)))
d0=-grad(fname,X0(1),X0(2));
i=1;
e=0.05;
% f1 = grad(fname,XNew(1),XNew(2));
% modf1=sqrt((f1(1)^2+f1(2)^2));
XNew=X0;
XOld=X0;
d=d0;
while true
    a=Dihotom(fname(XNew(1)+x*d(1),XNew(2)+x*d(2)),-10,10);
    XNew=XOld+a*d;
    f1 = grad(fname,XNew(1),XNew(2));
    modf1=sqrt((f1(1)^2+f1(2)^2));
    if modf1<=e
        break
    end
    if mod(i,2)==0
        b=0;
    else
        f1k1=grad(fname,XNew);
        f1k=grad(fname,XOld);
        b=(f1k1(1)^2+f1k1(2)^2)/(f1k(1)^2+f1k(2)^2);
    end
    d=-f1k1+b*d;
    i=i+1;
    XOld=XNew;
end
disp(XNew);