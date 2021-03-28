clc
clear
%% constants %%
Tsl=288.15; %kelvin
Psl=101325; %pascal
RHOsl=1.225; %Kg/m3
Rair=286.9; %J/KgK
L1=-6.5;
A=4.256;
RHO11=0.274;
P11=22631;
T11=216.65;
g=9.81;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Tsl30=Tsl+30;
Tsl20=Tsl+20;
Tsl10=Tsl+10;
Tsl_10=Tsl-10;
Tsl_20=Tsl-20;
Tsl_30=Tsl-30;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
RHO=zeros(1,7);
    RHO(1,1)=(Tsl*RHOsl)/Tsl30;
    RHO(1,2)=(Tsl*RHOsl)/Tsl20;
    RHO(1,3)=(Tsl*RHOsl)/Tsl10;
    RHO(1,4)=(Tsl*RHOsl)/Tsl;
    RHO(1,5)=(Tsl*RHOsl)/Tsl_10;
    RHO(1,6)=(Tsl*RHOsl)/Tsl_20;
    RHO(1,7)=(Tsl*RHOsl)/Tsl_30;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ISA30=zeros(1,55);
Tsl30=Tsl+30;
for i=1:55
    ISA30(1,i)=0.2*i-0.2;
    ISA30(2,i)=Tsl30 + ISA30(1,i) * L1;
    ISA30(3,i)=Psl * (( ISA30(2,i)/Tsl30)^(A+1));
    ISA30(4,i)=RHO(1,1)* (( ISA30(2,i)/Tsl30)^(A));
end
%%%%%
ISA20=zeros(1,55);
Tsl20=Tsl+20;
for i=1:55
    ISA20(1,i)=0.2*i-0.2;
    ISA20(2,i)=Tsl20 + ISA20(1,i) * L1;
    ISA20(3,i)=Psl * (( ISA20(2,i)/Tsl20)^(A+1));
    ISA20(4,i)=RHO(1,2)* (( ISA20(2,i)/Tsl20)^(A));
end
%%%%%
ISA10=zeros(1,55);
Tsl10=Tsl+10;
for i=1:55
    ISA10(1,i)=0.2*i-0.2;
    ISA10(2,i)=Tsl10 + ISA10(1,i) * L1;
    ISA10(3,i)=Psl * (( ISA10(2,i)/Tsl10)^(A+1));
    ISA10(4,i)=RHO(1,3)* (( ISA10(2,i)/Tsl10)^(A));
end
%%%%%
ISA=zeros(1,55);

for i=1:55
    ISA(1,i)=0.2*i-0.2;
    ISA(2,i)=Tsl + ISA(1,i) * L1;
    ISA(3,i)=Psl * (( ISA(2,i)/Tsl)^(A+1));
    ISA(4,i)=RHO(1,4)* (( ISA(2,i)/Tsl)^(A));
end
ISA_10=zeros(1,55);
Tsl_10=Tsl-10;
for i=1:55
    ISA_10(1,i)=0.2*i-0.2;
    ISA_10(2,i)=Tsl_10 + ISA_10(1,i) * L1;
    ISA_10(3,i)=Psl * (( ISA_10(2,i)/Tsl_10)^(A+1));
    ISA_10(4,i)=RHO(1,5)* (( ISA_10(2,i)/Tsl_10)^(A));
end
%%%%%
ISA_20=zeros(1,55);
Tsl_20=Tsl-20;
for i=1:55
    ISA_20(1,i)=0.2*i-0.2;
    ISA_20(2,i)=Tsl_20 + ISA_20(1,i) * L1;
    ISA_20(3,i)=Psl * (( ISA_20(2,i)/Tsl_20)^(A+1));
    ISA_20(4,i)=RHO(1,6)* (( ISA_20(2,i)/Tsl_20)^(A));
end
%%%%%
ISA_30=zeros(1,55);
Tsl_30=Tsl-30;
for i=1:55
    ISA_30(1,i)=0.2*i-0.2;
    ISA_30(2,i)=Tsl_30 + ISA_30(1,i) * L1;
    ISA_30(3,i)=Psl * (( ISA_30(2,i)/Tsl_30)^(A+1));
    ISA_30(4,i)=RHO(1,7)* (( ISA_30(2,i)/Tsl_30)^(A));
end
%%%%%
Hp=zeros(1,11);
for jj=1:11
    Hp(1,jj)=jj;
end
Pr=zeros(1,11);
Temp=zeros(1,100);
Rho=zeros(1,100);
HRho=zeros(1,100);
for k=1:100
    Temp(1,k)=180+1.2*k;
end
for j=1:11
    Pr(1,j)=Psl*((Tsl+(L1*Hp(1,j)))/Tsl)^(A+1);
    for jjj=1:100
        sigma=(Pr(1,j)/Psl)*(Tsl/Temp(1,jjj));
        Rho(1,jjj)=sigma*RHOsl;
        HRho(1,jjj)=(Tsl/L1)*(((sigma)^(1/A))-1);
    end
    plot(Temp(1,1:100),HRho(1,1:100))
    hold on
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

hold on
plot(ISA_30(2,1:55),ISA_30(1,1:55),'black')
hold on
plot(ISA_20(2,1:55),ISA_20(1,1:55),'black')
hold on
plot(ISA_10(2,1:55),ISA_10(1,1:55),'black')
hold on
plot(ISA(2,1:55),ISA(1,1:55),'black')
hold on
plot(ISA10(2,1:55),ISA10(1,1:55),'black')
hold on
plot(ISA20(2,1:55),ISA20(1,1:55),'black')
hold on
plot(ISA30(2,1:55),ISA30(1,1:55),'black')
