% Going to recognize the note that is being played in this audio 
% https://www.mathworks.com/matlabcentral/answers/19970-how-to-see-freq-response-of-a-wave-file 
% https://pages.mtu.edu/~suits/notefreqs.html 
sprintf('NOTE:')

[y,fs] = audioread(const.Part4.Note.AudioFile);
ydft = fft(y);

% Gets the positive coefficients
ydft = abs(ydft(1:length(y)/2+1));

% x axis
freq = 0:fs/length(y):fs/2;

% plot magnitude
fig();
plot(freq,ydft);
xlim(eval(const.Part4.Chord.PlotScope))
xlabel('Hz');
ylabel('Amplitude');
title('Note Spectrum');

maxval = 0; % variable that will hold the first max freq value over the amplitude threshold
amp = 0; % var to hold the max amplitude 
len = length(freq); % getting length of the frequency vector 
thresh = const.Part4.Note.AmplitudeThreshold; % read threshold for amplitude
for itr = 1:len
    if(ydft(itr) > thresh) % if we are over the threshold, don't want the low noise signal amp
        if(ydft(itr) > amp) % test to see if there is a max
            maxval = freq(itr);
            amp = ydft(itr);
        else 
            break; % get out of the loop if we are decreasing
        end
    end
end

% Load the notes table given by https://pages.mtu.edu/~suits/notefreqs.html 
notes = readtable(const.Part4.Note.NotesTable);

% I am getting the first max freq coefficient and using that to determine the what note it is
note_freq = table2array(notes(:,2))'; % Get the transpose of the second column 
[val,idx] = min(abs(note_freq-maxval)); % find index of the closest match 

% using the index of the first max val on the notes table
sprintf('   - Note from .wav file is: %s', string(notes(idx,1).Var1))

