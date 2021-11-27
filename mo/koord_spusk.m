syms x1 x2 x g(x) f(x1,x2);
g(x)=0;
alpha = x;
X0=[g(x);g(x)];
e=0.001;
f(x1, x2)=x1^2+x2^2+x1+x2;
XOld=X0;
XNew=XOld;
subX=XOld;
g=f;
 XNew(1)=subX(1)+(chords(g(subX(1)+x,subX(2)),-10,10));
 XNew(2)=subX(2)+(chords(g(subX(1),subX(2)+x),-10,10));
disp(abs(vec2fun(XNew)-vec2fun(subX)));
p=0;
while abs(vec2fun(XNew)-vec2fun(subX))>e
    subX=XNew
    XNew(1)=subX(1)+(chords(g(subX(1)+x,subX(2)),-10,10));
    g=subs(g,x1,subX(1));
    XNew(2)=subX(2)+(chords(g(subX(1),subX(2)+x),-10,10));
    g=subs(g,x2,subX(2));
    disp(subX)
    disp(abs(vec2fun(XNew)-vec2fun(subX)))

end
disp('Answer')
disp (subX)