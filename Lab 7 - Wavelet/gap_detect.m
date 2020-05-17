clear, clc, close all

fs = 100;
ts = 0: 1/fs : 3-1/fs;

x = sin(2*pi*5*ts);

% убираем из сигнала отсчёт с индексом 100
x(100) = [];

subplot(2,1,1)
plot(ts(1:length(ts)-1),x), grid on, title('Синусоида с разрывом')
xlabel('Время'), ylabel('Амплитуда')

% чтобы построить результаты функции cwt внутри subplot,
% приходится немного потанцевать с бубном
subplot(2,1,2)
[cfs,frq] = cwt(x,'amor',fs);
tms = (0:numel(x)-1)/fs;

surface(tms,frq,abs(cfs))
axis tight
shading flat
title('Вейвлет-преобразование')
xlabel('Время'), ylabel('Частота')