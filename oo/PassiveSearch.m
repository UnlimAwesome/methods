function v=PassiveSearch(formula)
syms fname(x);
fname(x) = formula;
Y=[];
a=1.5;
b=2;
X=a;
e=0.05;
v=fname(a);
for i=1:(b-a)/e
    a=a+e;
    if fname(a)<v
        mina=a;
        v=fname(a);
    end
end
% fplot(fname)
% hold on
% plot(mina,fname(a),'*','color','red')
end

