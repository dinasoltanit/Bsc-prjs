clc
clear

rho=1.2256;
w=73500*9.81;
s=122.4;
Cd0=0.024;
k=0.041;
V=zeros(2,200);
Cldmin=sqrt(Cd0/k);
Vdmin=sqrt((2*w)/(rho*s*Cldmin));
AA=0.5*rho*s*Cd0;
BB=(2*w^2*k)/(rho*s);
for n=1:50
   V(1,n)=-20-0.5*n;
   V(2,n)=sqrt((2*w)/(rho*s*sqrt((Cd0*(0.5+V(1,n)/330.15))/(k*(1.5+(V(1,n)/330.15))))));
end
plot(V(1,:),V(2,:))
grid on