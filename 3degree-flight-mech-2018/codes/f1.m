clc
clear

M=73500;
g=9.81;
W=M*g;
s=122.4;
chi_dot=0.02;
rho=0.6*1.225;

alpha=4*(pi/180);
Cl0=0.24;
Cl_alpha=5.19;
Cd0=0.024;
k=0.041;
Cl=Cl0+Cl_alpha*alpha;
Cd=Cd0+k*Cl^2; 
mu=10;
syms v_trim gamma_trim
Eq1= -0.5*rho*(v_trim)^2 * Cd - W*sin(gamma_trim)=0;
Eq2= -0.5*rho*v_trim^2 * Cl*cos(mu)+ W*cos(gamma_trim)==0;
[X1,X2]=solve(Eq1,Eq2,v_trim,gamma_trim);
v_trim=vpa(X1);
gamma_trim=vpa(X2);