w% Example 8: Chirp Signal

Fs = 200;
t = 0:1/Fs:1;
x = chirp(t,0,1,Fs/6);
nfft = 1024;
X = fft(x,nfft);
X = X(1:nfft/2);
mx = abs(X);
f = (0:nfft/2-1)*Fs/nfft;

fig();
plot(t,x);
title('Chirp Signal');
xlabel('Title (s)');
ylabel('Amplitude');
fig();
plot(f,mx);
title('Power Spectrum of Chirp Signal');
xlabel('Frequency (Hz)');
ylabel('Power');
