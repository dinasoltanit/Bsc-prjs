clc
clear
% initial data
dE=0.000001;
% vectors formation and filling
M=zeros(7,1);
e=zeros(1,6);
Y=zeros(6,7);
diff=1;
for i=1:7
    M(i,1)=(i-1)*pi/6;
end
e(1,1)=0.01;
e(1,6)=0.99;
for j=2:5
    e(1,j)=(j-1)*0.2;
end
% This loop finds the correct anomaly itteratively,
% for different Mean anomaly and eccentricity values
for m=1:7
    for k=1:6
        for E=0:dE:pi
            Y1=E-M(m,1);
            Y2=e(1,k)*sin(E);
            diff=abs(Y1-Y2);
            if diff<0.000001
%                 fprintf('the intersection is at E=%f',E)
                Y(m,k)=E;
                break
            end
        end
    end
end