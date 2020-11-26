% Step 2 
% Analyzing my own voice
% Saying: "Light of the Mind, Light of the World"

[x,Fs] = audioread(const.Part2.Step2.AudioFile); % Get audio file from res dir
nfft = length(x); % getting length of the sig

X = fft(x,nfft); % gett the fft of the sig 

% Get the spectral density variables
Pyy = X.*conj(X)/nfft; % y axis 
f = 1000/nfft*(0:127); % x axis

% Plot
fig();
plot(f,Pyy(1:128));
title('Power spectral density of my voice');
xlabel('Frequency (Hz)');
