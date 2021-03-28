
clc;
clear;

%%%%%%% Juilan Date
format long 
d=input('day = ');
m= input('month = ');
y= input('year = ');
time = datetime(y,m,floor(d));

if  m==1 || m==2
    m=m+12;
    y=y-1;
end
if time >= datetime(1582,7,15)
    A=floor(y/100);
    B=2-A+floor(A/4);
    JD=floor(365.25*y)+floor(30.6001*(m+1))+d+1720994.5+B ;
else
    JD=floor(365.25*y)+floor(30.6001*(m+1))+d+1720994.5 ;
end

T = (JD-2415020)/36525 ; %%%centuries


% % % L = mean longitude of the planet
% % % a = semimajor axis of the orbit (this element is a constant for each planet)
% % % e = eccentricity of the orbit
% % % i = inclination on the plane of the ecliptic
% % % w = argument of perihelion
% % % W = longitude of ascending node
        
weights_mars = [ 293.7373340   19141.69551   0.000310700   0.000000000
                 1.523688300   0.000000000   0.000000000   0.000000000
                 0.093312900   0.000092064  -0.000000077   0.000000000
                 1.850333000  -0.000675000   0.000012600   0.000000000
                 285.4317610   1.069766700   0.000131300   0.000004140
                 48.78644200   0.770991700  -0.000001400  -0.000005330];

X = [1; T;T^2;T^3];
parameter_mars = weights_mars * X;

L = mod (parameter_mars(1,1),360) ; %%%degree
a = parameter_mars(2,1);
e = parameter_mars(3,1);
i = parameter_mars(4,1);
w = parameter_mars(5,1);
W = parameter_mars(6,1);

M= L-w-W;