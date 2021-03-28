clc
clear all
mu_sun= 1.327124e20;%%%m
r_earth=1 ;%%%AU
r_mars=1.524;%%%AU
a_t=input('a_t =');
a_tc=a_t*149.597870e9;
e=1-r_earth/a_t;
v=acos((a_t*(1-e^2)/r_mars-1)/e);
true_anomaly= v*180/pi %%%degree

E=acos((e+cos(v))/(1+e*cos(v)));
TOF=(E-e*sin(E))*sqrt((a_tc)^3/mu_sun);
TOF_day=(TOF)/86400;
%%%departure phas angle%%%
delta_v = v*180/pi ;%%deg
delta_t = TOF_day;
w_mars=input('w_mars =');%%%deg/day
gama=delta_v - w_mars*delta_t

