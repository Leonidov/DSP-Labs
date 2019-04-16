% Пример, демонстрирующий зависимость результатов ДПФ
% от количества периодов исследуемого сигнала

clear;

Fs = 1;
ts = 0:1/Fs:30-1/Fs;

x1 = cos(2*pi*0.1*ts);  % 3 периода

x2 = [x1 x1];           % 6 периодов
x3 = [x1 x1 x1];        % 9 периодов

N = 2048;

X1 = abs(fft(x1,N));
X2 = abs(fft(x2,N));
X3 = abs(fft(x3,N));

F = (0:N-1)*Fs/N;

figure;
subplot(3,2,1)
plot(x1),title('3 периода'),axis([0 90 -1 1])
grid on

subplot(3,2,3)
plot(x2),title('6 периодов'),axis([0 90 -1 1])
grid on

subplot(3,2,5)
plot(x3),title('9 периодов'),axis([0 90 -1 1])
grid on

subplot(3,2,2)
plot(F,X1),title('3 периода'),axis([0 1 0 50])
grid on

subplot(3,2,4)
plot(F,X2),title('6 периодов'),axis([0 1 0 50])
grid on

subplot(3,2,6)
plot(F,X3),title('9 периодов'),axis([0 1 0 50])
grid on
