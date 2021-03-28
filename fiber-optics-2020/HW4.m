clc;clear;
%% The result would be the same both for the L_CD and L_NA
Loss=zeros(1,101);
for i=1:101
    Loss(1,i)=-10*log10(((i-1)*0.005)^2);
end
plot(0:0.005:0.5,Loss)