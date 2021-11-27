function phi_=subfun(XOld,fname,g1,g2,g3,g4,g5,r)
GRf=grad(fname,XOld(1),XOld(2));
GRg1=grad(g1,XOld(1),XOld(2));
GRg2=grad(g2,XOld(1),XOld(2));
GRg3=grad(g3,XOld(1),XOld(2));
GRg4=grad(g4,XOld(1),XOld(2));
GRg5=grad(g5,XOld(1),XOld(2));
phi_=GRf+2*r(GRg1*max([0 g1(XOld(1),XOld(2))]) + GRg2*max([0 g2(XOld(1),XOld(2))]) + GRg3*max([0 g3(XOld(1),XOld(2))]) + GRg4*max([0 g4(XOld(1),XOld(2))]) + GRg5*max([0 g5(XOld(1),XOld(2))]));