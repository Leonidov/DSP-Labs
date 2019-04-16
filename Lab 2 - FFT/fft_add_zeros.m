% Пример, демонстрирующий улучшение результатов ДПФ
% путём дополнения нулями

clear;

Fs = 1;
ts = 0:1/Fs:30-1/Fs;

x = cos(2*pi*0.1*ts);

N1 = 64;
N2 = 128;
N3 = 256;

X1 = abs(fft(x,N1));
X2 = abs(fft(x,N2));
X3 = abs(fft(x,N3));


F1 = (0 : N1-1)*Fs/N1;
F2 = (0 : N2-1)*Fs/N2;
F3 = (0 : N3-1)*Fs/N3;

subplot(3,1,1)
plot(F1,X1,'-x'),title('N = 64'),axis([0 1 0 20])
grid on

subplot(3,1,2)
plot(F2,X2,'-x'),title('N = 128'),axis([0 1 0 20])
grid on

subplot(3,1,3)
plot(F3,X3,'-x'),title('N = 256'),axis([0 1 0 20])
grid on
