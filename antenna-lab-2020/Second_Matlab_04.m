clc;
clear;

% f= input('please indicate the working frequency: \n');
% Vin= input('please indicate the amplitude of the voltage signal: \n');
% phi_in= input('please indicate the phase of the voltage signal, in radians: \n');
% L= input('please indicate the length of the waveguide: \n');
% ZL= input('please indicate the Impedance at the end of the waveguide: \n');
% m= input('please indicate m for TEmn mode: \n');
% n= input('please indicate n for TEmn mode: \n');

f= 6*10^9;
Vin=10;
phi_in=pi/4;
L=100;
ZL=100000;

m=1; n=0;
Z0=377; mu_r=1; eps_r=1; a=0.07; b=2*10^(-2);
c=3*10^8;
fc=c/(a);

Z_TEmn= Z0/(sqrt(1-(fc/f)^2));
beta_mn=pi*sqrt((2*f/c)^2-((m/a)^2 + (n/b)^2));
alpha=0;
G=(ZL-Z_TEmn)/(ZL+Z_TEmn);
rhoL=abs(G);
phiL=angle(G);
gamma= alpha + 1j*beta_mn;
w=2*pi*f;

y=linspace(0,0.2,1000);
arg2= phiL - 2*beta_mn*y;
V=zeros(1,1000);
for kk=1:1000
    V(1,kk)= Vin*abs(1+ rhoL * cos(arg2(kk)) + 1j*rhoL*sin(arg2(kk)));
end

grid on
plot(y,V,'b');
title('Satnding Wave Pattern at f = 6 GHz');
xlabel('y'); ylabel('abs(V(y))');