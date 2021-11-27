syms x1 x2 x g(x) ;
syms fname(x1, x2);
fname(x1,x2)=x1^2+x2^2+x1+x2;
g(x)=0;
X0=[g(x);g(x)];
e=0.05;
XOld=X0;
XNew=XOld;
GR=grad(fname,XOld(1),XOld(2)); 
f1 = grad(fname,XOld(1),XOld(2));
modf1=sqrt((f1(1)^2+f1(2)^2));
while modf1>e
    for p=1:2
        GR=grad(fname,XNew(1),XNew(2));
        subX(1)=XNew(1)-x*subs(GR(1),x1,XNew(1));
        subX(2)=XNew(2)-x*subs(GR(2),x2,XNew(2));
        root = Dihotom(fname(subX(1),subX(2)),-10,10);
        XNew(1)=XNew(1)-root*subs(GR(1),x1,XNew(1));
        XNew(2)=XNew(2)-root*subs(GR(2),x2,XNew(2));
    end
    root2 = Dihotom(fname(XOld(1)+x*(XNew(1)-XOld(1)),XOld(2)+x*(XNew(2)-XOld(2))),-10,10);
    XNew = [XOld(1)+root*(XNew(1)-XOld(1)); XOld(2)+root*(XNew(2)-XOld(2))];
    fprintf('%.10f\n', XNew(1))
    fprintf('%.10f\n', XNew(2))
    XOld=XNew;
    f1 = grad(fname,XNew(1),XNew(2));
    modf1=sqrt((f1(1)^2+f1(2)^2));
    disp (f1)
end
disp(XNew)