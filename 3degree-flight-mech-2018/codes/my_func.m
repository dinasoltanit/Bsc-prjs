function F=my_func(cl,V)
rho=1.2256;
w=73500*9.81;
s=122.4;
Cd0=0.024;
k=0.041;
F=((-0.5*w*Cd0)/(rho*s))+((1.5*k*w*cl^2)/(rho*s))-((V*k*cl^1.5)/(rho*s));
end