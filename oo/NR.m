function v = NR(formula,a)
syms fname(x);
fname(x) = formula;
% f=x.^4+8*x.^3-6*x.^2-72*x+90;
f1 = diff(fname);
f2 = diff(f1);
a=a;
b=2;
e=0.05;
xNew = a;
xOld = -xNew;
while xNew - xOld > eps
	xNew = xNew - f1(xNew) / f2(xNew);
    xOld = xNew;
end
v = (xNew + xOld)/2;
% disp ((xNew + xOld) / 2);
% fplot(fname)
% hold on
% plot((xNew + xOld) / 2,fname((xNew + xOld) / 2),'*','color','red')



% f=@(x)x.^4+8*x.^3-6*x.^2-72*x+90;
% f1=@(x)4*x.^3+24*x.^2-12*x-72;
% f2=@(x)12*x.^2+48*x-12;
% a=1.5;
% b=2;
% e=0.05;
% xNew = a;
% xOld = -xNew;
% while xNew - xOld > eps
% 	xNew = xNew - f1(xNew) / f2(xNew);
%     xOld = xNew;
% end
% disp ((xNew + xOld) / 2);
% fplot(f)
% hold on
% plot((xNew + xOld) / 2,f((xNew + xOld) / 2),'*','color','red')