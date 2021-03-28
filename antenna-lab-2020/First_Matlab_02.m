clc;
clear;

% f= input('please indicate the working frequency: \n');
% Vin= input('please indicate the amplitude of the voltage signal: \n');
% phi_in= input('please indicate the phase of the voltage signal, in radians: \n');
% L= input('please indicate the length of the waveguide: \n');
% ZL= input('please indicate the Impedance at the end of the waveguide: \n');
% m= input('please indicate m for TEmn mode: \n');
% n= input('please indicate n for TEmn mode: \n');

f= 6*1e9;
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
gamma= alpha + 1j*beta_mn;
w=2*pi*f;
y=linspace(-0.025*pi,0.025*pi,1000);

% Vp= Vin*cos(w*t - beta*y + phi_in);
% Vn= (Vin)*cos(w*t + beta*y + phi_in);

%z=linspace(-1*pi,1*pi,1000);
time=0;
for ii=1:100
    Vp= Vin*cos(w*time - beta_mn*y + phi_in);
    Vn= (Vin*abs(G))*cos(w*time + beta_mn*y + phi_in + angle(G));
    Vtot= Vp + Vn;
    plot(y,Vp,'g', y,Vn,'r', y,Vtot, 'b');
    grid on
    ylim([-20 20])
    pause(0.05);   
    time = time + 1e-2*(1/f);
end