clear;

Fs = 8000;
%Fs = 8765;
ts = 0 : 1/Fs : 0.001-1/Fs;
%ts = 0 : 1/Fs : 0.005-1/Fs;
N = length(ts);

x = sin(2*pi*1000*ts) + 0.5*sin(2*pi*2000*ts+3*pi/4);

% не хотите синус? Тогда вот господин Дирак:
%x = zeros(N,1);
%x(1) = 1;

figure;
plot(x); grid on;

% Один отсчёт Фурье
%X = 0;
%for n = 1 : N
%    X = X + x(n)*(cos(2*pi*(n-1)/N)-1i*sin(2*pi*(n-1)/N))
%end

% Все отсчёты
X = zeros(N,1);
tic;
for m = 1 : N
    for n = 1 : N
        X(m) = X(m) + x(n)*(cos(2*pi*(n-1)*(m-1)/N)-1i*sin(2*pi*(n-1)*(m-1)/N));
    end
end
toc

%tic;
%X = fft(x);
%toc

figure;
subplot(2,1,1)
stem(real(X)); grid on;
title('Действительная часть');
subplot(2,1,2)
stem(imag(X)); grid on;
title('Мнимая часть');

figure;
stem(abs(X)); grid on;
title('Амплитуда');

% Дальше на слайд про модули ДПФ

Xm = 2*abs(X)/N;

figure;
stem(Xm); grid on;
title('Правильная амплитуда');

% Дальше на слайд про частоты ДПФ

f = zeros(N,1);
for i = 1 : N
    f(i) = (i-1)*Fs/N;
end

figure;
stem(f, Xm); grid on;
title('Правильная амплитуда и частота');

%phi = atan2(imag(X),real(X))*180/pi;
phi = angle(X)*180/pi;

figure;
stem(f, phi); grid on;
title('Фаза');

% Поговорить про свойства ДПФ

% Вспомнить про господина Дирака (см. дельта-функцию выше)
