% ﻿https://stackoverflow.com/questions/25714491/quantize-data-in-matlab
[x, Fs] = audioread('every_salt_breeze.wav');

levels = linspace(min(x), max(x), 2^8);
y = interp1(levels, levels, x, 'nearest');