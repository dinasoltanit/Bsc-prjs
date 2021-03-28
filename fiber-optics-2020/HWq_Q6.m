clc;clear;
%%
syms landa
n=sqrt(abs(1+(1.1515019*landa^2)/(landa^2-1.0598413*10^(-2))+(0.118583612*landa^2)/(landa^2+0.011822519)+(1.26301359*landa^2)/(landa^2-129.617662)));
Dn=diff(n);
Dnn=diff(Dn);
% ng=n-landa*Dn;
% Dng=diff(ng);
func=(landa^2)*abs(Dnn);
landa1=vpa(subs(func,landa,1.5));
func2=func-0.015;
% while(1)
%     if ((vpa(func2))==0)
%         printf('%d',landa)
%         break;
%     end
% end
for i=1:3200
    value=vpa(subs(func2,landa,0.4+0.0005*i));
    
    if(abs(value)<0.0000001)
        printf('%d',0.4+0.0005*i)
        break;
    end
end