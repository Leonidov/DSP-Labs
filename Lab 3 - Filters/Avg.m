clear;

Fs = 10;
ts = 0: 1/Fs : 10-1/Fs;
N = length(ts);

% Параметры случайного сигнала.
a = -0.01;
b = 0.1;

x = (a + (b - a) * rand(1, N)).*sin(2*pi*0.5*ts);

% Функция Дирака
%x = zeros(N);
%x(5) = 1;

subplot(2,1,1);
plot(x); grid on;

y = zeros(1,N+6);
for i = 6 : length(x)
   y(i) = (x(i-1) + x(i-2) + x(i-3) + x(i-4) + x(i-5))*1/5;
end

subplot(2,1,2);
plot(y(1:100)); grid on;
