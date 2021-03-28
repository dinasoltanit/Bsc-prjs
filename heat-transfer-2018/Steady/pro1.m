clc
clear
%% Constants %%
[X,Y]=meshgrid(0:2:56,24:-2:0);
dx=0.002; %meter
dy=0.002; %meter
h=526.5; %watt/m2k
dx=dy;
qdot=10^7; %watt/m3
Tinf=23+273;%degrees celcious
Tc1=50+273; %degrees celcious
Tc2=273+25; %degrees celcious
n=377;
Ks=5; %watt/mk
Kc=52; %watt/mk
Km=28.5; %watt/mk
Bs=(h*dx)/Ks;% The biot Num.
Bc=(h*dx)/Kc;
Bm=(h*dx)/Km;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Writing the Eq.s %%
%%Deriving the factors matrix%%
T=zeros(n,n);
%%n=1
T(1,2)=1; T(1,14)=1; T(1,1)=-2;
%%n=2:12
i=2;
for i=2:12
    T(i,i)=-4;
    T(i,i-1)=1;
    T(i,i+1)=1;
    T(i,i+13)=2;
end
%%n=13
T(13,13)=-2-Bs; T(13,12)=1; T(13,26)=1;
%% The inside base
k=15;
for k=15:25
   T(k,k)=-4;
   T(k,k+1)=1;
   T(k,k-1)=1;
   T(k,k+13)=1;
   T(k,k-13)=1;
end
for k=28:38
   T(k,k)=-4;
   T(k,k+1)=1;
   T(k,k-1)=1;
   T(k,k+13)=1;
   T(k,k-13)=1;
end
for k=41:51
   T(k,k)=-4;
   T(k,k+1)=1;
   T(k,k-1)=1;
   T(k,k+13)=1;
   T(k,k-13)=1;
end
for k=54:64
   T(k,k)=-4;
   T(k,k+1)=1;
   T(k,k-1)=1;
   T(k,k+13)=1;
   T(k,k-13)=1;
end
for k=67:77
   T(k,k)=-4;
   T(k,k+1)=1;
   T(k,k-1)=1;
   T(k,k+13)=1;
   T(k,k-13)=1;
end
for k=80:90
   T(k,k)=-4;
   T(k,k+1)=1;
   T(k,k-1)=1;
   T(k,k+13)=1;
   T(k,k-13)=1;
end
for k=93:103
   T(k,k)=-4;
   T(k,k+1)=1;
   T(k,k-1)=1;
   T(k,k+13)=1;
   T(k,k-13)=1;
end
for k=106:116
   T(k,k)=-4;
   T(k,k+1)=1;
   T(k,k-1)=1;
   T(k,k+13)=1;
   T(k,k-13)=1;
end
for k=119:129
   T(k,k)=-4;
   T(k,k+1)=1;
   T(k,k-1)=1;
   T(k,k+13)=1;
   T(k,k-13)=1;
end
for k=132:138
   T(k,k)=-4;
   T(k,k+1)=1;
   T(k,k-1)=1;
   T(k,k+13)=1;
   T(k,k-13)=1;
end
for k=145:151
   T(k,k)=-4;
   T(k,k+1)=1;
   T(k,k-1)=1;
   T(k,k+13)=1;
   T(k,k-13)=1;
end
for k=158:164
   T(k,k)=-4;
   T(k,k+1)=1;
   T(k,k-1)=1;
   T(k,k+13)=1;
   T(k,k-13)=1;
end
for k=171:177
   T(k,k)=-4;
   T(k,k+1)=1;
   T(k,k-1)=1;
   T(k,k+13)=1;
   T(k,k-13)=1;
end
for k=184:190
   T(k,k)=-4;
   T(k,k+1)=1;
   T(k,k-1)=1;
   T(k,k+13)=1;
   T(k,k-13)=1;
end
for k=197:203
   T(k,k)=-4;
   T(k,k+1)=1;
   T(k,k-1)=1;
   T(k,k+13)=1;
   T(k,k-13)=1;
end
for k=210:216
   T(k,k)=-4;
   T(k,k+1)=1;
   T(k,k-1)=1;
   T(k,k+13)=1;
   T(k,k-13)=1;
end
for k=223:229
   T(k,k)=-4;
   T(k,k+1)=1;
   T(k,k-1)=1;
   T(k,k+13)=1;
   T(k,k-13)=1;
end
for k=236:242
   T(k,k)=-4;
   T(k,k+1)=1;
   T(k,k-1)=1;
   T(k,k+13)=1;
   T(k,k-13)=1;
end
for k=249:259
   T(k,k)=-4;
   T(k,k+1)=1;
   T(k,k-1)=1;
   T(k,k+13)=1;
   T(k,k-13)=1;
end
for k=262:272
   T(k,k)=-4;
   T(k,k+1)=1;
   T(k,k-1)=1;
   T(k,k+13)=1;
   T(k,k-13)=1;
end
for k=275:285
   T(k,k)=-4;
   T(k,k+1)=1;
   T(k,k-1)=1;
   T(k,k+13)=1;
   T(k,k-13)=1;
end
for k=288:298
   T(k,k)=-4;
   T(k,k+1)=1;
   T(k,k-1)=1;
   T(k,k+13)=1;
   T(k,k-13)=1;
end
for k=301:311
   T(k,k)=-4;
   T(k,k+1)=1;
   T(k,k-1)=1;
   T(k,k+13)=1;
   T(k,k-13)=1;
end
for k=314:324
   T(k,k)=-4;
   T(k,k+1)=1;
   T(k,k-1)=1;
   T(k,k+13)=1;
   T(k,k-13)=1;
end
for k=327:337
   T(k,k)=-4;
   T(k,k+1)=1;
   T(k,k-1)=1;
   T(k,k+13)=1;
   T(k,k-13)=1;
end
for k=340:350
   T(k,k)=-4;
   T(k,k+1)=1;
   T(k,k-1)=1;
   T(k,k+13)=1;
   T(k,k-13)=1;
end
for k=353:363
   T(k,k)=-4;
   T(k,k+1)=1;
   T(k,k-1)=1;
   T(k,k+13)=1;
   T(k,k-13)=1;
end
%% n=26:13:130
ii=26;
for ii=26:13:130
   T(ii,ii)=-4-2*Bs;
   T(ii,ii-1)=2;
   T(ii,ii+13)=1;
   T(ii,ii-13)=1;
end
%% n=156:13:234
for iii=156:13:234
   T(iii,iii)=-4-2*Bc;
   T(iii,iii-1)=2;
   T(iii,iii+13)=1;
   T(iii,iii-13)=1;
end
%% n=260:13:364
for jj=260:13:364
   T(jj,jj)=-4-2*Bs;
   T(jj,jj-1)=2;
   T(jj,jj+13)=1;
   T(jj,jj-13)=1;
end
%% n=152:13:230
for kk=152:13:230
   T(kk,kk)=-4;
   T(kk,kk+1)=Kc/Km;
   T(kk,kk-1)=Ks/Km;
   T(kk,kk+13)=1;
   T(kk,kk-13)=1;
end
%% n=140:142
for jjj=140:142
   T(jjj,jjj)=-4;
   T(jjj,jjj+1)=1;
   T(jjj,jjj-1)=1;
   T(jjj,jjj+13)=Kc/Km;
   T(jjj,jjj-13)=Ks/Km;
end
%% 244:246
for j=244:246
   T(j,j)=-4;
   T(j,j+1)=1;
   T(j,j-1)=1;
   T(j,j-13)=Kc/Km;
   T(j,j+13)=Ks/Km;
end
%%n=139
T(139,140)=1; T(139,152)=1; T(139,138)=Ks/Km;T(139,126)=Ks/Km;T(139,139)=-2-(2*Ks/Km);
%%n=143
T(143,130)=Ks/Km; T(143,156)=Kc/Km;T(143,142)=2;T(143,143)=-2-((Ks+Kc)/Km)-2*Bm;
%%n=247
T(247,260)=Ks/Km; T(247,234)=Kc/Km;T(247,246)=2;T(247,247)=-2-((Ks+Kc)/Km)-2*Bm;
%%n=243
T(243,230)=1; T(243,244)=1; T(243,242)=Ks/Km;T(243,256)=Ks/Km;T(243,243)=-2-(2*Ks/Km);
%%n=14:13:352
for uu=14:13:40
    T(uu,uu-13)=1;
    T(uu,uu+13)=1;
    T(uu,uu+1)=2;
    T(uu,uu)=-4;
end
for uu=66:13:300
    T(uu,uu-13)=1;
    T(uu,uu+13)=1;
    T(uu,uu+1)=2;
    T(uu,uu)=-4;
end
for uu=326:13:352
    T(uu,uu-13)=1;
    T(uu,uu+13)=1;
    T(uu,uu+1)=2;
    T(uu,uu)=-4;
end
%% n=inside the chip
for uuu=153:155
    T(uuu,uuu-13)=1;
    T(uuu,uuu+13)=1;
    T(uuu,uuu-1)=1;
    T(uuu,uuu+1)=1;
    T(uuu,uuu)=-4;
end
for uuu=166:168
    T(uuu,uuu-13)=1;
    T(uuu,uuu+13)=1;
    T(uuu,uuu-1)=1;
    T(uuu,uuu+1)=1;
    T(uuu,uuu)=-4;
end
for uuu=179:181
    T(uuu,uuu-13)=1;
    T(uuu,uuu+13)=1;
    T(uuu,uuu-1)=1;
    T(uuu,uuu+1)=1;
    T(uuu,uuu)=-4;
end
for uuu=192:194
    T(uuu,uuu-13)=1;
    T(uuu,uuu+13)=1;
    T(uuu,uuu-1)=1;
    T(uuu,uuu+1)=1;
    T(uuu,uuu)=-4;
end
for uuu=205:207
    T(uuu,uuu-13)=1;
    T(uuu,uuu+13)=1;
    T(uuu,uuu-1)=1;
    T(uuu,uuu+1)=1;
    T(uuu,uuu)=-4;
end
for uuu=218:220
    T(uuu,uuu-13)=1;
    T(uuu,uuu+13)=1;
    T(uuu,uuu-1)=1;
    T(uuu,uuu+1)=1;
    T(uuu,uuu)=-4;
end
for uuu=231:233
    T(uuu,uuu-13)=1;
    T(uuu,uuu+13)=1;
    T(uuu,uuu-1)=1;
    T(uuu,uuu+1)=1;
    T(uuu,uuu)=-4;
end
%%n=365
T(365,365)=-2; T(365,352)=1;
%%n=377
T(377,364)=1; T(377,377)=-2-Bs;
%%n=366:376
for zz=366:376
    T(zz,zz)=1;
end
T(53,53)=1;
T(313,313)=1;
%%Deriving the coefficient matrix%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
B=zeros(377,1);
B(13,1)=-Bs*Tinf;
B(243,1)=(-1)*qdot*(dx^2)/(4*Km);
for z=26:13:130
    B(z,1)=-2*Bs*Tinf;
end
for z=156:13:243
    B(z,1)=-(2*Bc*Tinf)+((-1)*qdot*(dx^2)/(Kc));
end
for z=260:13:364
    B(z,1)=(-1)*2*Bs*Tinf;
end
for z=152:13:230
    B(z,1)=(-1)*qdot*(dx^2)/(2*Km);
end
for z=140:142
    B(z,1)=(-1)*qdot*(dx^2)/(2*Km);
end
for z=244:246
    B(z,1)=(-1)*qdot*(dx^2)/(2*Km);
end
B(139,1)=(-1)*qdot*(dx^2)/(4*Km);
B(143,1)=-(2*Bm*Tinf)+((-1)*qdot*(dx^2)/(2*Km));
B(247,1)=-(2*Bm*Tinf)+((-1)*qdot*(dx^2)/(2*Km));
for z=366:376
    B(z,1)=Tc1;
end
B([53,313],1)=Tc2;
B(365,1)=-Tc1;
B(377,1)=-Tc1-(Bs*Tinf);
for z=153:155
    B(z,1)=(-1)*qdot*(dx*dy)/Kc;
end
for z=166:168
    B(z,1)=(-1)*qdot*(dx*dy)/Kc;
end
for z=179:181
    B(z,1)=(-1)*qdot*(dx*dy)/Kc;
end
for z=192:194
    B(z,1)=(-1)*qdot*(dx*dy)/Kc;
end
for z=205:207
    B(z,1)=(-1)*qdot*(dx*dy)/Kc;
end
for z=218:220
    B(z,1)=(-1)*qdot*(dx*dy)/Kc;
end
for z=231:233
    B(z,1)=(-1)*qdot*(dx*dy)/Kc;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%xlswrite('Pro1.xlsx',T)
%xlswrite('Pro2.xlsx',B)
%S=det(T)
Ans=T\B;
Tans=reshape(Ans,13,29)
TAns=flipud(Tans)
tdina=TAns-273*ones(13,29);
figure(1)
contour(X,Y,tdina,200),colorbar()
shading interp
figure(2)
surf(TAns)
figure(3)
pcolor(X,Y,tdina)
