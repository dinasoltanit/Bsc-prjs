clear all;close all
clc;
% DSP BSC course
% Demo program for OLA and OLS,
% by Hamid Sheikhzadeh, June, 2021
M=16;
L=6;
P=L+M-1; % Linear conv. length
%--------------------------
N=M; % OLS
delta=P -N; % No. of Wrong samples
x=1:M;
h=ones(1,L);
y=conv(x,h);
X=fft(x,N);
H=fft(h,N);
Y_OLS=X.*H;
y_ols=real(ifft(Y_OLS));
figure;
subplot(211);
% Now try time-aliasing the input.... should get the same result
Num=2;
z=zeros(1,P*Num);
q=zeros(P,Num);
for k=1:Num % Time repetition
    st=(k-1)*N+1;
    en=st+P-1;
    q(st:en,k)=y;
    z(st:en)=z(st:en)+y;
end;
subplot(311);
plot(q,'*-');grid on
title('Repeated linear convolution');
subplot(312);
plot(z,'*-');grid on;
title('Aliased results of linear convolution');
subplot(313);
plot(y,'b*-');
hold on;grid on;
plot(y_ols,'ro-');
title('Results of OLS (RED) and linear convolution (BLUE)');
% Now try OLA
N=P;    % OLA, zero padd both
X=fft(x,N);
H=fft(h,N);
Y_OLA=X.*H;
y_ola=real(ifft(Y_OLA));
figure;
plot(y,'b*-');
hold on;grid on;
plot(y_ola,'ro-');
title('Results of OLA (RED) and linear convolution (BLUE)');


