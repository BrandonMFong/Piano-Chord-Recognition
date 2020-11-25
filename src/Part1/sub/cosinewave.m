% Example 2: Cosine Wave 
Fs = 150;
t = 0:1/Fs:1;
f = 5;
x = cos(2*pi*t*f);
nfft = 1024;
X = fft(x,nfft);
X = X(1:nfft/2);
mx = abs(X);
f = (0:nfft/2-1)*Fs/nfft;
fig();
plot(t,x);
title('Sine Wave Signal');
xlabel('Time (s)');
ylabel('Amplitude');
fig();
plot(f,mx);
title('Power Spectrum of a Sine Wave');
xlabel('Frequency (Hz)');
ylabel('Power');

