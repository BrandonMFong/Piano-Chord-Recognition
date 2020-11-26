% Example 6: Gaussian Pulse
Fs = 60;
t = -.5:1/Fs:.5;
x = 1/(sqrt(2*pi*0.01))*(exp(-t.^2/(2*0.01)));
nfft = 1024;

X = fft(x,nfft);
X = X(1:nfft/2);
mx = abs(X);
f = (0:nfft/2-1)*Fs/nfft;

fig();
plot(t,x);
title('Gaussian Pulse Signal');
xlabel('Time (s)');
ylabel('Amplitude');
ylim([0 5]);
fig();
plot(f,mx);
title('Power Spectrum of a Gaussian Pulse');
xlabel('Frequency (Hz)');
ylabel('Power');
