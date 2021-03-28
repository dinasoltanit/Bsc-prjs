clc
clear

rho=1.2256;
w=73500*9.81;
s=122.4;
Cd0=0.024;
k=0.041;

V=zeros(2,82);
for n=1:82
    V(1,n)=-20-0.5*n;
    cl=fsolve(@my_func,0.44);
    V(2,n)=sqrt((2*w)/(rho*s*cl));
end
plot(V(1,:),V(2,:))