clc;clear;
%%
c=3*10^8; %m/s
Disp0=0;
landas=zeros(1,321);
for i=1:321
    landas(1,i)=400+(i-1)*(2000-400)/320;
end
indexes=zeros(1,321);
for i=1:321
    indexes(1,i)=index((10^(-3))*landas(1,i));
end
%%
syms landa
n=sqrt(abs(1+(1.1515019*landa^2)/(landa^2-1.0598413*10^(-2))+(0.118583612*landa^2)/(landa^2+0.011822519)+(1.26301359*landa^2)/(landa^2-129.617662)));
Dn=diff(n);
ng=n-landa*Dn;
Dng=diff(ng);
%%
Dns=zeros(1,321);
for i=1:321
    Dns(1,i)=vpa(subs(Dn,landa,((10^(-3))*landas(1,i))));
end
ngs=zeros(1,321);
for i=1:321
    ngs(1,i)=indexes(1,i)-((10^(-3))*landas(1,i))*Dns(1,i);
end
%%
Dngs=zeros(1,321);
for i=1:321
    Dngs(1,i)=vpa(subs(Dng,landa,((10^(-3))*landas(1,i))));
end
Disp=zeros(1,321);
for i=1:321
    Disp(1,i)=(-1/c)*Dngs(1,i);
    if (Disp(1,i)<0.000001 || Disp(1,i)> -0.000001)
        Disp0= (10^(-3))*landas(1,i)
    end
end
yyaxis left
plot(landas,indexes,'b')
xlabel('landa(microm)')
ylabel('indexes')
hold on
plot(landas,ngs,'r')
xlabel('landa(microm)')
ylabel('group indexes')
hold on
yyaxis right
plot(landas,Disp*10^9,'g')
xlabel('landa(micro-meter)')
ylabel('Dispersion (ps/micro-meter/Km)')