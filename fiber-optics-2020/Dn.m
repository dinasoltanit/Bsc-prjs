function Dindex=Dn(landa)
syms landa
n=sqrt(abs(1+(1.1515019*landa^2)/(landa^2-1.0598413*10^(-2))+(0.118583612*landa^2)/(landa^2+0.011822519)+(1.26301359*landa^2)/(landa^2-129.617662)));
Dindex=diff(n);
end