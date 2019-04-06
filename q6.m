clc
clear all

len = input('Enter the length of the signal: ');
L = input('Enter the up-sampling factor, L: ');
F = input('Enter the sinusoidal frequency (in Hz): ');

% Sample at Nyquist Frequency and take the '(len-1)/2' number of sequences
t = 0:1/2*F:(len-1)/2;
x = sin(2*pi*F*t + pi/2);

x_L = up_sampling_L(x, L);

s(1) = subplot(2, 1, 1);
s(2) = subplot(2, 1, 2);

stem(s(1), x);
title(s(1), 'Original Sequence');

stem(s(2), x_L);
title(s(2), 'Up-Sampled Sequence');

function x_L = up_sampling_L(x, L)
    N = length(x);
    new_length = N + (N-1)*(L-1);
    x_L = zeros([new_length 1]);
    x_L(1:L:end) = x(:);
end