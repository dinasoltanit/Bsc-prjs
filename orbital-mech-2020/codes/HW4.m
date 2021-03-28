clc
clear
%%-----Discription-----%%
% in each vector, the elements refer to Mercury, Venus, Mars, Jupiter
% Saturn, Uranus, Nepton, respectively.
%%-----Known data-----%%
mio_sun=132.712e9;%Km3s2
nE=2*pi/(365.26); %rad/d
%RE=6378; %Km
RE=150000000; %Km
%%-----must known data-----%%
Rs=RE*[0.387;0.723;1.523;5.202;9.554;19.218;30.11]; %Km
n=[2*pi/(87.97);2*pi/(224.7);2*pi/(1.881*365.26);2*pi/(11.86*365.26);2*pi/(29.46*365.26);2*pi/(84.01*365.26);2*pi/(164.8*365.26)]; %rad/d
%%-----TE calculation-----%%
TE=zeros(7,1);
for i=1:7
TE(i,1)=((pi/sqrt(mio_sun))*((RE+Rs(i,1))/2)^(3/2))/(24*3600);    
end
%%-----theta12 calculation-----%%
%teta12=pi-(n.*TE);
teta12=zeros(7,1);
for i=1:7
teta12(i,1)=pi-(n(i,1)*TE(i,1));    
end
%%-----theta12 calculation-----%%
%teta21=nE*TE;
teta21=zeros(7,1);
for i=1:7
teta21(i,1)=pi-nE*TE(i,1);    
end
%ID=[Rs n TE teta12 teta21];
%%-----Tsyn calculation-----%%
Tsyn=zeros(7,1);
for i=1:7
Tsyn(i,1)=2*pi/(abs(nE-n(i,1)));    
end
%%-----Twait calculation-----%%
Twait=zeros(7,1);
for j=1:7
    
    if (n(j,1)<nE)
        N=0;
        Twait(j,1)=(-(2*teta21(j,1))-2*pi*N)/((n(j,1)-nE));
            while (Twait(j,1)<0)
                Twait(j,1)=(-(2*teta21(j,1))-2*pi*N)/((n(j,1)-nE));
                N=N+1;
            end
    elseif (n(j,1)>nE)
        N=0;
        Twait(j,1)=(-(2*teta21(j,1))+(2*pi*N))/((n(j,1)-nE));
            while (Twait(j,1)<0)
                Twait(j,1)=(-(2*teta21(j,1))+(2*pi*N))/((n(j,1)-nE));
                N=N+1;
            end
    end
end

Ttrip=2*TE+Twait;
Table=[Tsyn TE Twait Ttrip]
fprintf('all the data are in \"days\" and it is considered that the travel strats from Earth!')
