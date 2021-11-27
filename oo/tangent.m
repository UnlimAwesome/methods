function v = tangent(formula,a,b)
syms fname(x);
fname(x) = formula;
f1 = diff(fname);
a=a;
b=b;
% a=1.5;
% b=2;
e=0.000005;
while b - a > 2 *e
    f1a = f1(a) ;
    f1b = f1(b);
	c = (-fname(b) + fname(a) + f1b*b - f1a*a) / (f1b - f1a);
	if f1(c) < 0
		a = c;
    else
        if c==0
            v=c;
%             fplot(fname);
%             hold on;
%             plot(((b+a)/2),fname((b+a)/2),'*','color','red');
            break
        end
		b = c;
    end
end
v =(b+a)/2;
% disp ((b+a)/2);
% fplot(fname);
% hold on;
% plot(((b+a)/2),fname((b+a)/2),'*','color','red');