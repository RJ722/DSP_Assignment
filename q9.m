Fs = 100;
f = 20;
t = 0:1/Fs:1;

s = sin(2*pi*f*t + pi/6);

snrs = -20:5:20;
co_c = zeros(size(snrs));

for i=1:length(snrs)
    r = awgn(s, snrs(i));
    co = corrcoef(s, r);
    co_c(i) = co(2, 1);
end

plot(snrs, co_c);
xlabel('SNR');
ylabel('Correlation coefficient of transmitted and recieved signal');