clear;

fs1 = 60;         %fs - sampling frequency – частота дискретизации
fs2 = 200;
fs3 = 1000;      

T=10;            % T – длительность сигнала

t1 = 0:1/fs1:T;
t2 = 0:1/fs2:T;
t3 = 0:1/fs3:T;

y1 = sin(2*pi*50*t1);
y2 = sin(2*pi*50*t2);
y3 = sin(2*pi*50*t3);


plot(t1(1:10),y1(1:10),'-ro',t2(1:30),y2(1:30),'-g>',t3(1:150),y3(1:150),'-b')
grid on                 % Отображение сетки
xlabel('Time');         % Подпись оси X
ylabel('Amplitude');    % Подпись оси Y
title('SIGNAL');        % Заголовок графика

