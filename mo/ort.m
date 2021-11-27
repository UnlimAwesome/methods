syms x1 x2 x g(x);
g(x)=0;
alpha = 0.1;
lambda=0.8;
X0=[g(x);g(x)];
e=0.01;
XOld=X0;
subX=XOld;
i=1;
sup=0;
while i<=length(symvar(x1^2+x2^2+x1+x2))
        subX(i)=subX(i)+alpha;
        if vec2fun(subX)<vec2fun(XOld)
            XOld=subX;
            disp(subX);
            sup=1;
            continue;          
        end 
        subX=XOld;
        subX(i)=subX(i)-alpha;
        if vec2fun(subX)<vec2fun(XOld)
            XOld=subX;
            disp(subX);
            sup=1;
            continue;              

        end 
        subX=XOld;  
    if abs(vec2fun(subX)-vec2fun(X0))<e
        break
    end
    if (sup~=1)&(i==length(symvar(x1^2+x2^2+x1+x2))-1)
        alpha=alpha*lambda;
        continue;
    else
        if i==length(symvar(x1^2+x2^2+x1+x2))-1
           i=2;
        else
           i=i+1;
        end
    end
end
disp(subX)