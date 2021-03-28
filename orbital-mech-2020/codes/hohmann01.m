clc
clear all
%%%parameters%%%
%%%1AU=1.49597870691e8 km%%%
mu_sun=1.32712440018e11;%%%km^3/s^2
mu_earth=398600.44;%%%km^3/s^2
mu_mars=42828.3;%%%km^3/s^2
a_earth=1.00000261;%%%AU
a_mars=1.52371034;%%%AU
r_earth=6378.14;%%%km
r_mars=3396.2;%%%km
z_earth=200;%%%km
z_mars=300;%%%km

%%%earth's velocity around the sun(circular orbit)%%%

v_earth=sqrt(mu_sun/(a_earth*1.49597870691e8));%%%(km/s)

%%%mars's velocity around the sun(circular orbit)%%%

v_mars=sqrt(mu_sun/(a_mars*1.49597870691e8));%%%(km/s)

%%%Hohman transfer orbit semi major axis%%%
a_hohmann=a_earth+a_mars;%%%AU

%%%the energy of the spacecraft in hohmann transfer orbit%%%

E_hohmann= -(mu_sun)/(a_hohmann*1.49597870691e8);%%%(km^2/s^2)

%%% velocity of periapsis and apoapsis in the Hohmann orbit%%%
v_Hper=sqrt(2*(E_hohmann+(mu_sun)/(a_earth*1.49597870691e8)));%%%(km/s)
v_Hapo=sqrt(2*(E_hohmann+(mu_sun)/(a_mars*1.49597870691e8)));%%%(km/s)

%%%delta v for transfer out of earth's orbit
%%%delta v for entry in mars orbits
deltav_out=v_Hper-v_earth;%%%(km/s)

deltav_in=v_mars-v_Hapo;%%%(km/s)


%%%LEO&LMO calculation
%%%earth & mars low orbit velocities%%%
v_LEO=sqrt((mu_earth)/(r_earth+z_earth));%%%(km/s)
v_LMO=sqrt((mu_mars)/(r_mars+z_mars));%%%(km/s)

%%%delta v needed to get escape from earth's orbit%%%

v_esc=sqrt((deltav_out^2)+(2*mu_earth)/(r_earth+z_earth));%%%(km/s)

%%%delta v required to get from LEO to mars transfer orbit

deltav_inject=v_esc-v_LEO;%%%(km/s)

%%%the velocity of that hyperbolic trajectory at the altitude of low mars orbit

v_app=sqrt((deltav_in^2)+(2*mu_mars)/(r_mars+z_mars));%%%(km/s)

%%%delta v required for insertion into path that follows mars%%%

deltav_insert=v_LMO-v_app;%%%(km/s)

%%%velocity nedded in low mars orbit%%%

v_zero=sqrt(2*(mu_mars)/(r_mars+z_mars));%%%(km/s)

%%%velocity change imparted%%%

delta_v=v_zero-v_app;%%%(km/s)


%%%Hohmann's transfer period
T_hohmann=pi*sqrt(((a_earth+a_mars)*1.49597870691e8)^3/(8*mu_sun))/86400;%%%day

