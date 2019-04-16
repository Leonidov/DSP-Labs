clear;

N = 12;               %количество гармоник
Fs = 100;             %частота дискретизации
t = -1:1/Fs:1-1/Fs;   %вектор временных отсчётов

nh = (1:N)*2-1;
y = sin(2*pi*nh'*t);

Am = 4/pi./nh;

s1 = y.*Am';
s2 = cumsum(s1);

for k = 1:N
    subplot(3,N/3,k)
    plot(t, s2(k,:)); grid on
    %s_fft = abs(fft(s2(k,:)));
    %stem(s_fft); grid on
    title(['Гармоник: ' num2str(k)])
end
