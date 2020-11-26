% Example 7: Exponential Decay
Fs = 150;
t = 0:1/Fs:1;
x = 2*exp(-5*t);
nfft = 1024;

X = fft(x,nfft);
% half
X = X(1:nfft/2);
mx = abs(X);

f = (0:nfft/2-1)*Fs/nfft;

fig();
plot(t,x);
title('Exponential Decay Signal');
xlabel('Time (s)');
ylabel('Amplitude');
fig();
plot(f,mx);
title('Power Spectrum of Exponential Decay Signal');
xlabel('Frequency (Hz)');
ylabel('Power');