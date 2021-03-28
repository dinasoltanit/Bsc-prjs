clc
clear
% h=input('Please enter the altitude. The altitude might be as the Ex. 8.2 Km in the range of 0 to 32 Kms.\n your entery must be mazrabe sahihe 0.2\n')/0.2;

%% constants %%
Tsl=288.15; %kelvin
Psl=101325; %pascal
RHOsl=1.225; %Kg/m3
Rair=286.9; %J/KgK
L1=-6.5;
L2=1;
A=4.256;
RHO11=0.274;
P11=22631;
T11=216.65;
T20=T11;
g=9.81;
B=-g/(Rair*T11);
C=-g/(Rair*L2);
P20=5467.83;
RHO20=0.066;
%%calculations%%

I=zeros(4,161);
for i=1:55
    I(1,i)=0.2*i-0.2;
    I(2,i)=Tsl + I(1,i) * L1;
    I(3,i)=Psl * (( I(2,i)/Tsl)^(A+1));
    I(4,i)=RHOsl* (( I(2,i)/Tsl)^(A));
end
for i=56:101
    I(1,i)=0.2*i-0.2;
    I(2,i)=T11;
    I(3,i)=P11* exp(B*(I(1,i)-11000));
    I(4,i)=RHO11* exp(B*(I(1,i)-11000));  
end
for i=102:161
    I(1,i)=0.2*i-0.2;
    I(2,i)=T20 + I(1,i) * L2;
    I(3,i)=P20 * (( (T20 + L2*(I(1,i)*1000 - 20000))/T20)^(C));
    I(4,i)=RHO20* (( (T20 + L2*(I(1,i)*1000 - 20000))/T20)^(C-1));
end
% fprintf('the result for the altitude that you have entered is:\nH\t\t\tT\t\t\tP\t\t\t\tRHO\n%f\t%f\t%f\t%f',I(1,h),I(2,h),I(3,h),I(4,h))

plot(I(2,1:55),I(1,1:55))