% Example 3: Cosine Wave with Phase Shift
Fs = 150;
t = 0:1/Fs:1;
f = 5;
pha = 1/3*pi;
x = cos(2*pi*t*f+pha);
nfft = 1024;
X = fft(x,nfft);
X = X(1:nfft/2);
mx = abs(X);
f = (0:nfft/2-1) * Fs/nfft;
fig();
plot(t,x);
title('Cosine with Phase shift');
xlabel('Time (s)');
ylabel('Amplitude');
fig();
plot(f,mx);
title('Power Spectrum of the shifted cosine wave');
xlabel('Frequency (Hz)');
ylabel('Power');

