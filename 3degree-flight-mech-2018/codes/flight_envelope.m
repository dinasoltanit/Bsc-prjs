clc
clear
clear all
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
P20=5467.83;
RHO20=0.066;
gamma=1.4;
% vminMAX=0;
% vmaxMAX=0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=0.0374;
CD0=0.021;
s=122.4;
WE=42100*9.81;
ThSL=240000;
cl_max=2.56;
h_cruise=11.28;
Mach_max=0.8;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%calculations
deltat=zeros(1,5);
for i=1:5
    deltat(1,i)=0.2*i+0.2;
end
I=zeros(7,200);
for j=1:4
    for i=1:111
        I(1,i)=0.1*i-0.1;%height
        I(2,i)=Tsl + I(1,i) * L1;%Temperature
        I(3,i)=RHOsl* (( I(2,i)/Tsl)^(A));%Density
        Tha=ThSL*deltat(1,j)*(( I(2,i)/Tsl)^(A))^0.7;
        AA=0.5*I(3,i)*s*CD0;
        BB=(2*WE^2*k)/(I(3,i)*s);
        I(6,i)=sqrt((2*WE)/(I(3,i)*s*cl_max));
        I(7,i)=Mach_max*sqrt(gamma*Rair*I(2,i));        
        if (Tha^2 - 4*AA*BB <= 0)
            I(4,i)=sqrt(Tha/(2*AA));%vmin
            I(5,i)=sqrt(Tha/(2*AA));%vmax
L            break
        end
        I(4,i)=sqrt((Tha-sqrt(Tha^2 - 4*AA*BB))/(2*AA));%vmin
        I(5,i)=sqrt((Tha+sqrt(Tha^2 - 4*AA*BB))/(2*AA));%vmax
    end
    for i=111:200
        I(1,i)=(0.1*i)-0.1;%height
        I(2,i)=T11;%temperature
        I(3,i)=RHO11* exp(B*(I(1,i)*1000-11000));%density
        Tha=ThSL*deltat(1,j)*((RHO11/RHOsl)*exp(B*(I(1,i)*1000-11000)))*1.43;
        AA=0.5*I(3,i)*s*CD0;
        BB=(2*WE^2*k)/(I(3,i)*s);
        I(6,i)=sqrt((2*WE)/(I(3,i)*s*cl_max));
        I(7,i)=Mach_max*sqrt(gamma*Rair*I(2,i));
        if (Tha^2 - 4*AA*BB <= 0)
            I(4,i)=sqrt(Tha/(2*AA));%vmin
            I(5,i)=sqrt(Tha/(2*AA));%vmax
            break
        end
        I(4,i)=sqrt((Tha-sqrt(Tha^2 - 4*AA*BB))/(2*AA));%vmin
        I(5,i)=sqrt((Tha+sqrt(Tha^2 - 4*AA*BB))/(2*AA));%vmax
    end
   
    plot(I(4,1:i),I(1,1:i),'cyan','LineWidth',2)
    hold on
    plot(I(5,1:i),I(1,1:i),'b','LineWidth',2)
    hold on
end
plot(I(6,1:187),I(1,1:187),'g--','LineWidth',1)
hold on
plot(I(7,1:187),I(1,1:187),'black.','LineWidth',1)
