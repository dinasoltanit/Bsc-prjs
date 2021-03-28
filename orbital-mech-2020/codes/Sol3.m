clc
clear
% initial data
M=49*pi/180;
e=0.1;
% first guess
E1=M;
E2=E1;
% finding the correct anomaly
err=1;
while (err>0.00001)
    E2= M+ e*sin(E1);
    err=abs(E2-E1);
    E1=E2;
end
