clear all;close all
clc;
%
%  DSP BSC course
% % Demo program for effect of zero-padding of FFT,
% by Hamid Sheikhzadeh,May 2020
%
 M=10;
Inp=ones(1,M);
n=0:1:M-1;
%Inp=sin(2*pi/(M/2)*n); % Try this too
for N=[M, M*1.5, M*2]
    InpFft=fft(Inp,N);
    figure
    plot(abs(InpFft),'*-');grid on
    title(['M= ', num2str(M), ', N=',num2str(N)]);
end
%
