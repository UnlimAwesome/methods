function v=Dihotom(formula,a,b)
syms fname(x);
fname(x) = formula;
% a=1.5;
% b=2;
% a=a;
% b=b;

e=0.05;
delta=0.001;
while (b-a)>(2*e)
%     plot(a,fname(a),'*','color','blue')
%     hold on
%     plot(b,fname(b),'*','color','blue')    
    c=((b+a)/2)-delta;
    d=((b+a)/2)+delta;
%     plot(c,fname(c),'*','color','blue')
%     plot(d,fname(d),'*','color','blue')
    if (fname(c) < fname(d))
        b = d;
    else
        a = c;
    end
end
v=(b+a)/2;

% fplot(fname)
% disp ((b+a)/2)
% plot(((b+a)/2),fname((b+a)/2),'*','color','red')