clear, clc, close all

fs = 100;

f1 = 10;
f2 = 20;
f3 = 30;

% Задаём сигнал с тремя подряд идущими частотами
t1= 0 : 1/fs : 1-1/fs;
lt1 = length(t1);
x(1 : lt1)=sin(2*pi*10*t1);

t2= 1 : 1/fs : 2-1/fs;
lt2 = length(t2);
x(lt1 + 1 : lt1 + lt2) = sin(2*pi*20*t2);

t3= 2 : 1/fs : 3-1/fs;
lt3 = length(t3);
x(lt1 + lt2 + 1 : lt1 + lt2 + lt3) = sin(2*pi*30*t3);

t = [t1 t2 t3];
N = length(t);

subplot(2,1,1)
plot(t,x), grid on, title('Сигнал с тремя подряд идущими частотами')
xlabel('Время'), ylabel('Амплитуда')

X = 2*abs(fft(x))/N;
f = 0: fs/N : fs-fs/N;

subplot(2,1,2)
stem(f,X), grid on, title('Спектр данного сигнала')
xlabel('Частота'), ylabel('Амплитуда')

figure
cwt(x,'amor',fs)

% формируем набор фильтров
fb = cwtfilterbank('SignalLength',numel(x),'SamplingFrequency',fs,...
    'FrequencyLimits',[10 30]);
figure
freqz(fb)

% применяем сформированный набор фильтров
figure
cwt(x,'FilterBank',fb)
