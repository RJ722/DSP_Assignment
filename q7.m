clc;
clearvars -global;

len = input('Enter the length of the signal: ');
M = input('Enter the down-sampling factor, M: ');
F = input('Enter the sinusoidal frequency (in Hz): ');

% Sample at Nyquist Frequency
Fs = 2*F;
t = (0:len-1) * (1/Fs);
x = sin(2*pi*F*t + pi/4);

x_M = down_sampling_M(x, M);

subplot(2, 2, 1);
stem(x);
title('Original Sequence');

subplot(2, 2, 2);
stem(x_M);
title('Down-Sampled Sequence');

subplot(2, 2, 3);

f = Fs * (0:(len/2))/len;

Y = compute_FT(x);
plot(f, Y);
title('FT of original sequence, x(t)');

subplot(2, 2, 4);
% https://dsp.stackexchange.com/questions/40369/downsampling-in-matlab-simple-example
len_M = length(x_M);
f_M = Fs * (0:(len_M/2))/len_M;

Y_M = compute_FT(x_M);
plot(f_M, Y_M);
title('FT of down-sampled signal, x_M(t)');

function P1 = compute_FT(x)
    Y = fft(x);

    % Compute the two-sided spectrum P2. Then compute the single-sided
    % spectrum P1 based on P2 and the even-valued signal length 'len'.
    N = length(x);
    P2 = abs(Y/N);
    P1 = P2(1:N/2+1);
    P1(2:end-1) = 2*P1(2:end-1);
end

function x_M = down_sampling_M(x, M)
    x_M(:) = x(1:M:end);
end