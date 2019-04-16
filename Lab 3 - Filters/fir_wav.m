%clear;

[x,Fs] = audioread('rock.wav');

subplot(2,1,1);
stem(abs(fft(x))); grid on;

% fltr - фильтр с параметрами:
% Bandpass
% Fs = 11025;               % Sampling Frequency
% Fstop1 = 700;             % First Stopband Frequency
% Fpass1 = 800;             % First Passband Frequency
% Fpass2 = 2400;            % Second Passband Frequency
% Fstop2 = 2500;            % Second Stopband Frequency
% Dstop1 = 0.01;            % First Stopband Attenuation
% Dpass  = 0.057501127785;  % Passband Ripple
% Dstop2 = 0.01;            % Second Stopband Attenuation
% dens   = 20;              % Density Factor

y = filter(fltr,1,x);

subplot(2,1,2);
stem(abs(fft(y))); grid on;

audiowrite('rock-out.wav', y, Fs);
