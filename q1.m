Fs = 20;
F = 10;
M = 5;

t = 0:1/Fs:1;
x = sin(2*pi*F*t + pi/6);

% Add a zero between every two samples
N = length(x);
x_new = zeros([2*N-1 1]);
x_new(1:2:end) = x(:);

B = ones(1, M)/M
A = [1];
y = filter(B, A, x_new);

plot(y)
