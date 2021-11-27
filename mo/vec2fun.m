function v = vec2fun( X0)
syms fname(x1, x2)
fname(x1,x2)=x1^2+x2^2+x1+x2;
v=fname(X0(1),X0(2));