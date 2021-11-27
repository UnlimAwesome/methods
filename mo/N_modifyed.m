syms x1 x2 x g(x) ;
syms fname(x1, x2);
fname(x1,x2)=x1^2+x2^2+x1+x2;
g(x)=0;
X0=[g(x);g(x)];
f1x1=diff(fname,x1);
f1x2=diff(fname,x2);
m1 = grad(fname,X0(1),X0(2));
m2=inv([diff(f1x1,x1) diff(f1x1,x2);diff(f1x2,x1) diff(f1x2,x2)]);
% disp(fname(X0(1)-x*(m2(1)*m1(1)+m2(2)*m1(2)),X0(2)-x*(m2(3)*m1(1)+m2(4)*m1(2))));
res=m2*m1';
res(1)=res(1)(0,0)
disp res
disp(res(0,0));
% a=Dihotom(fname(res(1),res(2)),-10,10);
% X(1)=X0(1)-x*(m2(1)*m1(1)+m2(2)*m1(2));
% x(2)=X0(2)-x*(m2(3)*m1(1)+m2(4)*m1(2));
% disp (X);
