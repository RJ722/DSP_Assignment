clc;
clearvars -global;

low_pass_filter = fir1(10, 0.25, 'low'); 
Fs = 8000;
T = 1/Fs;
L = 1500;
t = (0:L-1)*T;    
 
x = cos(2*pi*500*t) + cos(2*pi*1000*t) +cos(2*pi*1500*t);
stem(t,x)
axis([0 0.01 -4 4])
H1 = impz(low_pass_filter);
z = conv(x,H1);

figure;
subplot(2,1,1);
Y = fft(x);
S2 = abs(Y/L);
S1 = S2(1:L/2+1);
S1(2:end-1) = 2*S1(2:end-1);
 
F = Fs*(0:(L/2))/L;
plot(F,S1) 
title('Input')
xlabel('f(Hz)')
ylabel('|S_i(f)|')

subplot(2,1,2)
Z = fft(z);
S2 = abs(Z/L);
S1 = S2(1:L/2+1);
S1(2:end-1) = 2*S1(2:end-1);
F = Fs*(0:(L/2))/L;
 
plot(F,S1) 
title('Output')
xlabel('f(Hz)')
ylabel('|S_o(f)|')
