%clear;

Fs = 8000;
T = 0.1;
ts = 0:1/Fs:T-1/Fs;

% Исходный сигнал
x = sin(2*pi*1000*ts)+0.5*sin(2*pi*2000*ts+3*pi/4);

subplot(2,2,1);
plot(x(50:70)); grid on;

subplot(2,2,2);
stem(abs(fft(x))); grid on;

% fltr - фильтр с параметрами:
% Bandpass
% Fs = 8000;                % Sampling Frequency
% Fstop1 = 1300;            % First Stopband Frequency
% Fpass1 = 1900;            % First Passband Frequency
% Fpass2 = 2100;            % Second Passband Frequency
% Fstop2 = 2700;            % Second Stopband Frequency
% Dstop1 = 1e-06;           % First Stopband Attenuation
% Dpass  = 0.057501127785;  % Passband Ripple
% Dstop2 = 1e-06;           % Second Stopband Attenuation
% dens   = 20; 

y = filter(fltr,1,x);

subplot(2,2,3);
plot(y(50:70)); grid on;

subplot(2,2,4);
stem(abs(fft(y))); grid on;
