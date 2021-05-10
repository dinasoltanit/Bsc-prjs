%% HW1-Q1
clc; clear; close;
x1=zeros(1,31);
u1= ones(1,31);
 for ii=1:31
    x1(1,ii)=cos(pi*(ii-6)/4) * u1(1,ii); 
 end
figure(1)
stem(x1)
xlabel('time (n)');
ylabel('x1');
title('part q1-b-1');
%--
x2=zeros(1,21);
u2= ones(1,21);
for ii=1:21
   x2(1,ii)=((0.9)^(-(ii-1)))* u2(1,ii) ; 
end
figure(2)
stem(x2)
xlabel('time (n)');
ylabel('x2');
title('part q1-b-2');
%--
Wn= -1 + 2.*rand(1,21);
x3= round(5* Wn);
figure(3)
stem(x3)
xlabel('time (n)');
ylabel('x3');
title('part q1-b-3');
%-- Commutation
x41= conv(x1,x2);
x42= conv(x2,x1);
figure(4)
subplot(1,2,1)
stem(x41)
xlabel('time (n)');
ylabel('amp');
title('x1 * x2');
subplot(1,2,2)
stem(x42)
xlabel('time (n)');
ylabel('amp');
title('x2 * x1');
%-- Association
x51= conv( conv(x1,x2) , x3);
x52= conv( x1 , conv(x2,x3));
figure(5)
subplot(1,2,1)
stem(x51)
xlabel('time (n)');
ylabel('amp');
title('(x1 * x2) * x3');
subplot(1,2,2)
stem(x52)
xlabel('time (n)');
ylabel('amp');
title('x1 * (x2 * x3)');
%-- Distribution
x61= conv( x1 , (x2 + x3));
x62= conv(x1,x2) + conv(x1,x3);
figure(6)
subplot(1,2,1)
stem(x61)
xlabel('time (n)');
ylabel('amp');
title('x1(n) * [x2(n) + x3(n)]');
subplot(1,2,2)
stem(x62)
xlabel('time (n)');
ylabel('amp');
title('x1(n) * x2(n) + x1(n) * x3(n)');
%-- Identity
figure(7)
xd=[zeros(1,10) 1 zeros(1,10)];
stem(xd);
yd=conv(x1,xd);
subplot(2,1,1);stem(yd);xlabel('time(n)');ylabel('amp');title('x1*(delta(n-11))');
subplot(2,1,2);stem(x1);xlabel('time(n)');ylabel('amp');title('x1');
% needs more time
%% HW1-Q2
clc; clear; close;
n=-50:50;
x7=zeros(1,101);
u7= [ zeros(1,50) ones(1,51) ];
for ii=1:101
   x7(1,ii)=(2+ 0.5^(ii-1))* u7(1,ii) ; 
end
a7=[1 -0.4 -0.45]; b7=[0.45 0.4 -1];
% without convolution
s7=filter(b7,a7, x7);
S7=freqz(s7);
% ignoring the condition y(-1)=0 since I couldn't figure out in what domain
% this has to be applied
figure(8)
subplot(3,2,1)
stem(S7)
xlabel('freq'); ylabel('S7'); title('ferq domain: output with solving difference eq.');
subplot(3,2,3)
stem(abs(S7))
xlabel('freq'); ylabel('magnitude'); title('Magnitude');
subplot(3,2,5)
stem(angle(S7))
xlabel('freq'); ylabel('phase'); title('Angle');
% with convolution
h7=filter(b7,a7,n);
y7=conv(x7,h7,'full');
%--
Y7=freqz(y7);
subplot(3,2,2)
stem(Y7)
xlabel('freq'); ylabel('Y7'); title('ferq domain: output with conv');
subplot(3,2,4)
stem(abs(Y7))
xlabel('freq'); ylabel('magnitude'); title('Magnitude');
subplot(3,2,6)
stem(angle(Y7))
xlabel('freq'); ylabel('phase'); title('Angle');
%--
figure(9)
subplot(3,1,1)
stem(h7)
xlabel('time(n)'); ylabel('h7(n)'); title('impulse respone');
subplot(3,1,2)
stem(y7)
xlabel('time(n)'); ylabel('y7(n)'); title('output signal, conv');
subplot(3,1,3)
stem(s7)
xlabel('time(n)'); ylabel('s7(n)'); title('output signal, difference eq.');
%% HW1-Q3
clc; clear; close;
M1=10; M2=50; M3=101;
M=M1;
rm= ones(1,M+1); % rectangular
cm = zeros(1,M+1); %Hanning
for ii=1:M+1
	cm(1,ii)=0.5*(1- cos( (2*pi*(ii-1))/(M) ));
end
tm = zeros(1,M+1); %Triangular
for ii=1:M+1
	tm(1,ii)=(1- ( abs(M-2*(ii-1))/(M) ));
end
hm = zeros(1,M+1); %Hamming
for ii=1:M+1
	hm(1,ii)=0.54- 0.46* (cos( (2*pi*(ii-1))/(M) ));
end
%-- M=M1
Rm= freqz(rm);
Cm= freqz(cm);
Tm= freqz(tm);
Hm= freqz(hm);
figure(10) %-- figuring
subplot(4,2,1); stem(Rm)
xlabel('freq'); ylabel('Rm'); title('Rectangular, DTFT');
subplot(4,2,3); stem(Cm)
xlabel('freq'); ylabel('Cm'); title('Hanning, DTFT');
subplot(4,2,5); stem(Tm)
xlabel('freq'); ylabel('Tm'); title('Triangular, DTFT');
subplot(4,2,7); stem(Hm)
xlabel('freq'); ylabel('Hm'); title('Hamming, DTFT');
subplot(4,2,2); stem(rm)
xlabel('time(n)'); ylabel('rm'); title('Rectangular');
subplot(4,2,4); stem(cm)
xlabel('time(n)'); ylabel('cm'); title('Hanning');
subplot(4,2,6); stem(tm)
xlabel('time(n)'); ylabel('tm'); title('Triangular');
subplot(4,2,8); stem(hm)
xlabel('time(n)'); ylabel('hm'); title('Hamming');

%-- M=M2
M=M2;
rm= ones(1,M+1); % rectangular
cm = zeros(1,M+1); %Hanning
for ii=1:M+1
	cm(1,ii)=0.5*(1- cos( (2*pi*(ii-1))/(M) ));
end
tm = zeros(1,M+1); %Triangular
for ii=1:M+1
	tm(1,ii)=(1- ( abs(M-2*(ii-1))/(M) ));
end
hm = zeros(1,M+1); %Hamming
for ii=1:M+1
	hm(1,ii)=0.54- 0.46* (cos( (2*pi*(ii-1))/(M) ));
end
Rm= freqz(rm);
Cm= freqz(cm);
Tm= freqz(tm);
Hm= freqz(hm);
figure(11) %-- figuring
subplot(4,2,1); stem(Rm)
xlabel('freq'); ylabel('Rm'); title('Rectangular, DTFT');
subplot(4,2,3); stem(Cm)
xlabel('freq'); ylabel('Cm'); title('Hanning, DTFT');
subplot(4,2,5); stem(Tm)
xlabel('freq'); ylabel('Tm'); title('Triangular, DTFT');
subplot(4,2,7); stem(Hm)
xlabel('freq'); ylabel('Hm'); title('Hamming, DTFT');
subplot(4,2,2); stem(rm)
xlabel('time(n)'); ylabel('rm'); title('Rectangular');
subplot(4,2,4); stem(cm)
xlabel('time(n)'); ylabel('cm'); title('Hanning');
subplot(4,2,6); stem(tm)
xlabel('time(n)'); ylabel('tm'); title('Triangular');
subplot(4,2,8); stem(hm)
xlabel('time(n)'); ylabel('hm'); title('Hamming');

%-- M=M3
M=M3;
rm= ones(1,M+1); % rectangular
cm = zeros(1,M+1); %Hanning
for ii=1:M+1
	cm(1,ii)=0.5*(1- cos( (2*pi*(ii-1))/(M) ));
end
tm = zeros(1,M+1); %Triangular
for ii=1:M+1
	tm(1,ii)=(1- ( abs(M-2*(ii-1))/(M) ));
end
hm = zeros(1,M+1); %Hamming
for ii=1:M+1
	hm(1,ii)=0.54- 0.46* (cos( (2*pi*(ii-1))/(M) ));
end
Rm= freqz(rm);
Cm= freqz(cm);
Tm= freqz(tm);
Hm= freqz(hm);
figure(12) %-- figuring
subplot(4,2,1); stem(abs(Rm))
xlabel('freq'); ylabel('Rm'); title('Rectangular, DTFT');
subplot(4,2,3); stem(abs(Cm))
xlabel('freq'); ylabel('Cm'); title('Hanning, DTFT');
subplot(4,2,5); stem(abs(Tm))
xlabel('freq'); ylabel('Tm'); title('Triangular, DTFT');
subplot(4,2,7); stem(abs(Hm))
xlabel('freq'); ylabel('Hm'); title('Hamming, DTFT');
subplot(4,2,2); stem(rm)
xlabel('time(n)'); ylabel('rm'); title('Rectangular');
subplot(4,2,4); stem(cm)
xlabel('time(n)'); ylabel('cm'); title('Hanning');
subplot(4,2,6); stem(tm)
xlabel('time(n)'); ylabel('tm'); title('Triangular');
subplot(4,2,8); stem(hm)
xlabel('time(n)'); ylabel('hm'); title('Hamming');

%%HW1-Q4
clc; clear; close;
n=-50:50;
%x7=zeros(1,101);
u8= [ zeros(1,50) ones(1,51) ];
a8=[4 -2*sqrt(2) 1];
b8=[1 -2*sqrt(2) 4];
h8=filter(b8,a8,n); % impulse response
H8=(freqz(h8))';
h8_step=filter(b8,a8,u8); % impulse response
figure(13)
stem(H8)
xlabel('freq'); ylabel('H(w)'); title('Frequency Response');
figure(14)
subplot(2,1,1); stem(n,h8)
xlabel('time(n)'); ylabel('h(n)'); title('Impulse Response');
subplot(2,1,2); stem(n,h8_step)
xlabel('time(n)'); ylabel('h_u(n)'); title('Step Response');
% --
fvtool(b8,a8,'polezero')
[b8,a8] = eqtflength(b8,a8);
[z,p,k] = tf2zp(b8,a8);
text(real(z)+.1,imag(z),'Zero')
text(real(p)+.1,imag(p),'Pole')
