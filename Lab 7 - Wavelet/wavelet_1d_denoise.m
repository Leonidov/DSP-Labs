clear, clc, close all

% формируем тестовый чистый и зашумлённый сигнал
% с помощью готовой функции WaveletToolbox
[X,XN] = wnoise('bumps',10,sqrt(6));

% строим графики этих сигналов
subplot(3,1,1)
plot(X), grid on, title('Исходный сигнал')
xlabel('Время'), ylabel('Амплитуда')

subplot(3,1,2)
plot(XN), grid on, title('Зашумлённый сигнал')
xlabel('Время'), ylabel('Амплитуда')

% убираем шум с помощью вейвлета Хаара
XDN = wdenoise(XN, 10, 'Wavelet', 'db4');

subplot(3,1,3)
plot(XDN), grid on, title('Сигнал после вейвлет-преобразования')
xlabel('Время'), ylabel('Амплитуда')