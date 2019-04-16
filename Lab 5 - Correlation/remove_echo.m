%
% Удаление эхо из аудиофайла с использованием автокорреляции
%

clear;

% Исходный файл
[x,Fs] = audioread('rock.wav',[1, 100000]);

figure
plot(x)
title('Исходный сигнал')
grid on;

% Добавляем эхо
a = 0.5;
d = 10000;

y = zeros(size(x));

for i = d+1 : length(x)
    y(i) = x(i)+a*x(i-d);
end

%sound(y(1:100000),Fs);

% АКФ файла
[xc,lags] = xcorr(y,'coeff');

xc = xc(lags>0);
lags = lags(lags>0);

figure
plot(lags/Fs,xc)
xlabel('Временной сдвиг, с')
grid on;

figure
findpeaks(xc,lags,'MinPeakHeight', 0.3);

[peaks,dl] = findpeaks(xc(200:length(xc)),lags(200:length(xc)),'MinPeakHeight', 0.3);

% Применяем БИХ-фильтр (его знаменатель)
y_clean = filter(1,[1 zeros(1,dl-1) 0.5],y);

figure
subplot(2,1,1)
plot(y)
title('Сигнал с эхом')
grid on;

subplot(2,1,2)
plot(y_clean)
title('Сигнал без эха')
xlabel('Время, с');
grid on;

sound(y_clean(1:100000),Fs);
