% Going to recognize the chord that is being played in this audio 
% https://www.mathworks.com/matlabcentral/answers/19970-how-to-see-freq-response-of-a-wave-file 
% https://pages.mtu.edu/~suits/notefreqs.html 

[y,fs] = audioread(const.Part4.AudioFile);
ydft = fft(y);

% Gets the positive coefficients
ydft = abs(ydft(1:length(y)/2+1));

% x axis
freq = 0:fs/length(y):fs/2;

% % plot magnitude
plot(freq,ydft);
xlim([0 5000])
xlabel('Hz');
ylabel('Amplitude');

maxval = 0;
amp = 0;
len = length(freq);
for itr = 1:len
    if(ydft(itr) > amp)
        maxval = freq(itr);
        amp = ydft(itr);
    end
end