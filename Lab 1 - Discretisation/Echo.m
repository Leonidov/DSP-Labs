clear;

[x,Fs] = audioread('Alarm05.wav');

a = 0.5;
d = 20000;
%d =10000;

y = zeros(size(x));

for i = d+1 : length(x)
    y(i) = x(i)+a*x(i-d);
%    y(i, 1) = x(i, 1) + a*x(i-d, 2);
%    y(i, 2) = x(i, 2) + a*x(i-d, 1);
end

audiowrite('Alarm05-out.wav', y, Fs);
sound (y,Fs)
