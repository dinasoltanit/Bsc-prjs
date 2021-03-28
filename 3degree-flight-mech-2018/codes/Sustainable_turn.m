clear
clc

TSL=9000;
L=-6.5;
k=0.041;
rho = 1.2256;
WE = 73500*9.81;
s = 122.4;
CD0 = 0.024;
Clmax1=2.56;
Clmax2=-2.14;
mach=0.75;
AE=0.5*rho*s*CD0;
BE=2*k*WE^2/rho*s;
Thm=240000;
nmax1=3;%structure
nmax2=Thm/(WE*2*sqrt(k*CD0));%sustain
%%calculation%%
I=zeros(3,3123);
CHI=zeros(4,3123);
Vmin=18.85;
Vmax=330.15;
for n=1:5000
    I(1,n)=Vmin+0.1*n;
    I(2,n)=0.5*rho*(I(1,n))^2;
    CHI(1,n)=(9.81/sqrt(2*I(2,n)/rho))*sqrt(((s^2*(I(2,n)^2)/(k*WE^2))*((Thm/I(2,n)*s)-CD0))-1);%thrust
    CHI(2,n)=(9.81/I(1,n))*sqrt(((s^2*(I(2,n))^2*(Clmax1)^2)/(WE^2))-1);%CL
    CHI(3,n)=(9.81/I(1,n))*(sqrt(nmax1^2-1));%structure
    CHI(4,n)=(9.81/I(1,n))*(sqrt(nmax2^2-1));%sustain
end
plot(I(1,1:5000),CHI(1,1:5000))
hold on
plot(I(1,1:3123),CHI(2,1:3123))
hold on
plot(I(1,1:3123),CHI(3,1:3123))
hold on
plot(I(1,1:3123),CHI(4,1:3123))


