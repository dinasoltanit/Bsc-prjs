clc
clear
fun=@anomaly;
x0=0.9052; % first guess comes from the Newton-Rophson Method
fsolve(fun,x0)