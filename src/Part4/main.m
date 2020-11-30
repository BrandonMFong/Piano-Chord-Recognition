% Going to recognize the chord that is being played in this audio 

% [xin,Fs] = audioread(const.Part4.AudioFile); % Get audio file from res dir
% nfft = length(xin); % getting length of the sig

% X = fft(xin,nfft); % gett the fft of the sig 

% p2 = abs(X/nfft);
% p1 = p2(1:nfft/2+1);
% p1(2:end-1) = 2*p1(2:end-1);
% f = Fs*(0:(nfft/2))/nfft;
% plot(f,p1);

% title('Single-Sided Amplitude Spectrum of signal')
% xlabel('f (Hz)')
% ylabel('|P1(f)|')

[y, Fs] = audioread(const.Part4.AudioFile);      % y is sound data, Fs is sample frequency.
t = (1:length(y))/Fs;         % time

ind = find(t>0.1 & t<0.12);   % set time duration for waveform plot
figure; subplot(1,2,1)
plot(t(ind),y(ind))  
axis tight         
title(['Waveform of ' const.Part4.AudioFile])

N = 2^12;                     % number of points to analyze
c = fft(y(1:N))/N;            % compute fft of sound data
p = 2*abs( c(2:N/2));         % compute power at each frequency
f = (1:N/2-1)*Fs/N;           % frequency corresponding to p

subplot(1,2,2)
semilogy(f,p)
axis([0 4000 10^-4 1])                
title(['Power Spectrum of ' const.Part4.AudioFile])