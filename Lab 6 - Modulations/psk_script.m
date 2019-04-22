clear;

M = 8;
data = randi([0 M-1],1000,1);

figure;
plot(data); grid;

txSig = pskmod(data, M);
rxSig = awgn(txSig,20);

scatterplot(rxSig); grid on;

dataOut = pskdemod(rxSig,M,pi/M);
