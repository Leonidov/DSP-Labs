clear;

[x, Fs] = audioread('Alarm05.wav');

val = 0.03;

y = x;

for i = 1:length(x)
    if y(i,1) > val
        y(i,1) = val;
    end
    if y(i,1) < -val
        y(i,1) = -val;
    end
    if y(i,2) > val
        y(i,2) = val;
    end
    if y(i,2) < -val
        y(i,2) = -val;
    end
end

plot(y); grid on

audiowrite('Alarm05-out.wav', y, Fs)

sound (y, Fs)
