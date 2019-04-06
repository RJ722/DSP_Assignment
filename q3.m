clc;
clear all;

M = 5;

[x, Fs] = audioread('enjoy_10k.wav');

% sound(x, Fs);

% Add a zero between every two samples
N = length(x);
x_new = zeros([2*N-1 1]);
x_new(1:2:end) = x(:);

plot(x_new);
% sound(x_new, Fs);

B = ones(1, M)/M;
A = [1];
y = filter(B, A, x_new);

sound(y, Fs);