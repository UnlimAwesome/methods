function v=ZolSech(formula)
syms fname(x);
fname(x) = formula;

a=1.5;
b=2;
e=0.05;
while (b-a)>(2*e)
%     plot(a,fname(a),'*','color','blue')
%     hold on
%     plot(b,fname(b),'*','color','blue')    
    c=a + ((3 - sqrt(5)) / 2) * (b - a);
    d=a + ((sqrt(5)-1)/2)*(b - a);
%     plot(c,fname(c),'*','color','blue')
%     plot(d,fname(d),'*','color','blue')
    if fname(c) < fname(d)
        b = d;
    else
        a = c;
    end
end
v=(b+a)/2;
% fplot(fname)
% disp ((b+a)/2)
% plot(((b+a)/2),fname((b+a)/2),'*','color','red')