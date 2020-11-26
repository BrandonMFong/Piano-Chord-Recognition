% Example 5: Square Pulse

Fs = 150;
t = -0.5:1/Fs:0.5;
w = .2;
x = rectpuls(t,w);
nfft = 512; % Length of FFT 

X = fft(x,nfft);
X = X(1:nfft/2);
mx = abs(X);
f = (0:nfft/2-1)*Fs/nfft;
fig();
plot(t,x);
title('Square Pulse Signal');
xlabel('Time (s)');
ylabel('Amplitude');
ylim([0 2]);
fig();
plot(f,mx);
title('Power Spectrum of a Square Pulse');
xlabel('Frequency (Hz)');
ylabel('Power');