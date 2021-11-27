function v=Fibona44i(formula)
syms fname(x);
fname(x) = formula;
a=1.5;
b=2;
e=0.05;
delta=0.1;
n=1;
fib=1;
while fib<(b-a)*(1+delta)/2/e
fib=round( ( (1 + sqrt(5) / 2) ^n - ( (1 - sqrt(5) / 2) ^n)) /sqrt(5) );
n=n+1;
end
c = a + (b - a) * (round(((1 + sqrt(5) / 2)^(n-1) - ((1 - sqrt(5) / 2)^(n-1))) /sqrt(5)) / round(((1 + sqrt(5) / 2)^(n+1) - ((1 - sqrt(5) / 2)^(n+1))) /sqrt(5)));
d = a + (b - a) * (round(((1 + sqrt(5) / 2)^n - ((1 - sqrt(5) / 2)^n)) /sqrt(5)) / round(((1 + sqrt(5) / 2)^(n+1) - ((1 - sqrt(5) / 2)^(n+1))) /sqrt(5)));
while n>0
    n = n-1;
	fc = fname(c); 
    fd =fname(d);
	if fc > fd
        a=c;
        c=d;
        d =  a + (b - a) * (round( ( (1 + sqrt(5) / 2) ^n - ( (1 - sqrt(5) / 2) ^n)) /sqrt(5) ) / round(((1 + sqrt(5) / 2)^(n+1) - ((1 - sqrt(5) / 2)^(n+1))) /sqrt(5)));
    else
        b = d   ;             
        c = a + (b - a) * (round(((1 + sqrt(5) / 2)^(n-1) - ((1 - sqrt(5) / 2)^(n-1))) /sqrt(5)) / round(((1 + sqrt(5) / 2)^(n+1) - ((1 - sqrt(5) / 2)^(n+1))) /sqrt(5)));
        d=c;
    end
end
v=(b+a)/2;
% disp (v)
% fplot(fname)
% hold on
% plot(((b+a)/2),fname((b+a)/2),'*','color','red')