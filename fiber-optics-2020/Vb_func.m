clc;clear;
syms V
b=(1.1428-(0.996/V))^2;
Vb=V*b;
Exp=V*diff(diff(Vb))
