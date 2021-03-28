clear
clc

rho = 1.2256;
w = 73500*9.81;
s = 122.4;
Cd0 = 0.024;
k = 0.041;
Clmax1=2.56;
Clmax2=-2.14;
mach=0.75;
%%Calculation%%
Vs1=sqrt((2*w)/(rho*s*Clmax1));
Vs2=sqrt((2*w)/(rho*s*(-Clmax2)));
Vmax=mach*sqrt(1.4*287*288.15)*0.5;
N=ones(1,60);
M1=ones(1,36);
M2=ones(1,24);
H=zeros(2,60);
for n=1:36
    H(1,n)=0.1*n-0.1;
end
for n=37:60
    H(1,n)=-0.1*(n-37);
end
for n=1:36
    H(2,n)=sqrt(H(1,n))*Vs1;
end
for n=37:60
    H(2,n)=sqrt(-H(1,n))*Vs2;
end
plot(H(2,1:36),H(1,1:36),'b')
hold on
plot(H(2,37:60),H(1,37:60),'b')
hold on
plot(H(2,1:60),N*3,'r')
hold on
plot(H(2,1:60),-1.5*N,'r')
hold on
plot((Vmax*M1),H(1,1:36),'y')
hold on
plot(Vmax*M2,H(1,37:60),'y')
