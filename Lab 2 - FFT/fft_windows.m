%
% Использование окон для улучшение результатов ДПФ
%

clear;

Fs = 32000;

%ts = 0:1/Fs:0.001-1/Fs;
ts = 0:1/Fs:0.005-1/Fs;
N = length(ts);

a2 = 0.075;
%f2 = 9500;
f2 = 9700;

x1 = sin(2*pi*8000*ts)+a2*sin(2*pi*f2*ts);
X1 = abs(fft(x1));

subplot(3,2,1)
stem(X1)
grid on; title ('8000 Гц');

x2 = sin(2*pi*8500*ts)+a2*sin(2*pi*f2*ts);
X2 = abs(fft(x2));

subplot(3,2,3)
stem(X2)
grid on; title ('8500 Гц');

x3 = sin(2*pi*8750*ts)+a2*sin(2*pi*f2*ts);
X3 = abs(fft(x3));

subplot(3,2,5)
stem(X3)
grid on; title ('8750 Гц');

x1w = x1.*hanning(N)';
X1w = abs(fft(x1w));

subplot(3,2,2)
stem(X1w)
grid on; title ('8000 Гц (с окном)');

x2w = x2.*hanning(N)';
X2w = abs(fft(x2w));

subplot(3,2,4)
stem(X2w)
grid on; title ('8500 Гц (с окном)');

x3w = x3.*hanning(N)';
X3w = abs(fft(x3w));

subplot(3,2,6)
stem(X3w)
grid on; title ('8750 Гц (с окном)');