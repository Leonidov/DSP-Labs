clear;

Fs = 8000;
%Fs = 8765;
ts = 0 : 1/Fs : 0.001-1/Fs;
%ts = 0 : 1/Fs : 0.005-1/Fs;
N = length(ts);

x = sin(2*pi*1000*ts) + 0.5*sin(2*pi*2000*ts+3*pi/4);

% функция Дирака:
%x = zeros(N,1);
%x(1) = 1;

figure;
plot(x); grid on;

% Считаем ДПФ "вручную"
X = zeros(N,1);
tic;
for m = 1 : N
    for n = 1 : N
        X(m) = X(m) + x(n)*(cos(2*pi*(n-1)*(m-1)/N)-1i*sin(2*pi*(n-1)*(m-1)/N));
    end
end
toc

% Считаем БПФ
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

% Модули ДПФ

Xm = 2*abs(X)/N;

figure;
stem(Xm); grid on;
title('Правильная амплитуда');

% Частоты ДПФ

f = (0:N-1)*Fs/N;

figure;
stem(f, Xm); grid on;
title('Правильная амплитуда и частота');

% Фаза ДПФ

phi = angle(X)*180/pi;

figure;
stem(f, phi); grid on;
title('Фаза');
