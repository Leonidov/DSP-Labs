clear;

Fs = 10;
ts = 0: 1/Fs : 10-1/Fs;
N = length(ts);

x = 0.1*sin(2*pi*0.5*ts);
x = awgn(x,20);

subplot(2,1,1)
plot(x), grid on, title('Исходный сигнал')
xlabel('Время')

[xc, lags] = xcorr(x,'unbiased');
subplot(2,1,2)
plot(lags/Fs,xc), grid on, title('Автокорреляционная функция')
xlabel('Временной сдвиг')
