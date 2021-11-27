function v = chords(formula,a,b)
% f=x.^4+8*x.^3-6*x.^2-72*x+90;
syms fname(x);
fname(x) = formula;
f1 = diff(fname);
% a=1.5;
% b=2;
a=a;
b=b;
e=0.005;
xOld = b;
xNew = a;
while abs(f1(xNew)) > e
	xNew = xNew - f1(xNew)*(xOld-xNew) / (f1(xOld)-f1(xNew));
    y= (x-xNew)*(f1(xOld)-f1(xNew))/(xOld-xNew)+f1(xNew);
%     fplot(y);
%     hold on;
end
v = (xNew + xOld)/2;
% disp ((xNew + xOld) / 2);
% fplot(fname,'color','black')
% hold on
% plot((xNew + xOld) / 2,fname((xNew + xOld) / 2),'*','color','red')
