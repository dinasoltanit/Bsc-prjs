clc
clear
% initial data
M=49*pi/180;
e=0.1;
ratio=1;
% first guess
if M<pi
   E0=M+e/2; 
else
   E0=M-e/2;
end
% finding the correct anomaly
while (abs(ratio)>0.00001)
    fE= E0-e*sin(E0)-M;
    fE_p=1-e*cos(E0);
    ratio=fE/fE_p;
    E0=E0-ratio;
end