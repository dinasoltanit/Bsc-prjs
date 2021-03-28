clc
clear
% initial data
dE=0.000001;
M=0.5236;
e=0.2;
% finding the correct eccentric anomaly
for E=0:dE:pi
Y1=E-M;
Y2=e*sin(E);
Y=abs(Y1-Y2);
if Y<0.000001
    fprintf('the intersection is at E=%f and',E)
end
end


