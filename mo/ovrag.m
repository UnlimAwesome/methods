syms x1 x2 x g(x) ;
syms fname(x1, x2);
fname(x1,x2)=x1^2+x2^2+x1+x2;
g(x)=0;
X0=[g(x);g(x)];
X02=[g(x)+0.5; g(x)+0.5];
e=0.05;
XOld=X0;
XOld2=X02;
XNew=XOld;
XNew2=XOld2;
GR=grad(fname,XOld(1),XOld(2)); 
GR2=grad(fname,XOld2(1),XOld2(2)); 
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
    for p=1:2
        GR2=grad(fname,XNew2(1),XNew2(2));
        subX2(1)=XNew2(1)-x*subs(GR2(1),x1,XNew2(1));
        subX2(2)=XNew(2)-x*subs(GR2(2),x2,XNew2(2));
        root = Dihotom(fname(subX2(1),subX2(2)),-10,10);
        XNew2(1)=XNew2(1)-root*subs(GR2(1),x1,XNew2(1));
        XNew2(2)=XNew2(2)-root*subs(GR2(2),x2,XNew2(2));
    end
    root2 = Dihotom(fname(XNew(1)+x*(XNew2(1)-XNew(1)),XNew(2)+x*(XNew2(2)-XNew(2))),-10,10);
    XNew = [XNew(1)+root*(XNew2(1)-XNew(1)); XNew(2)+root*(XNew2(2)-XNew(2))];
    XNew2=[XNew(1)+0.1;XNew(2)+0.1];
%     fprintf('%.10f\n', XNew(1))
%     fprintf('%.10f\n', XNew(2))
    f1 = grad(fname,XNew(1),XNew(2));
    modf1=sqrt((f1(1)^2+f1(2)^2));
    disp (modf1)
end
disp(XNew)
    fprintf('%.10f\n', XNew(1))
    fprintf('%.10f\n', XNew(2))