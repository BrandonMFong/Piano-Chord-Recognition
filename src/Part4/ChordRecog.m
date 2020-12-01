% Going to recognize the note that is being played in this audio 
% https://www.mathworks.com/matlabcentral/answers/19970-how-to-see-freq-response-of-a-wave-file 
% https://pages.mtu.edu/~suits/notefreqs.html 
% in this section I am identifying major chords

sprintf('CHORD:')

[y,fs] = audioread(const.Part4.Chord.AudioFile);
ydft = fft(y);

ydft = abs(ydft(1:length(y)/2+1));

freq = 0:fs/length(y):fs/2;

plot(freq,ydft);
xlim([0 200])
xlabel('Hz');
ylabel('Amplitude');

% init chord vars
chordlength = const.Part4.Chord.Length; % Length of the chord, just doing three at first 
chord = [0 0 0; 0 0 0]; % init the var that holds the freq
chorditr = 1; % index for the chord array 

maxval = 0; % I wont need this since I am using chord
amp = 0; 
len = length(freq);
thresh = const.Part4.Chord.AmplitudeThreshold; 

% find frequency of chords
for itr = 1:len
    if(ydft(itr) > thresh) 

        % if the amplitude is greater than the last iteration, then save the frequency and update the amp var
        if(ydft(itr) > amp) % test to see if there is a max
            chord(1,chorditr) = freq(itr);
            chord(2,chorditr) = itr; % saving the index of the freq and amp
            amp = ydft(itr);
        end
    else
        % break; % get out of the loop if we are decreasing
        if (chorditr > 3)
            break;
        end
        
        % I think I need to do this outside the threshold test because we might still be testing max in that case
        % if the index is 0, then we haven't found the next note
        % but if it is filled, that means we found a frequency
        if(chord(1,chorditr) ~= 0)
            chorditr = chorditr + 1;
            amp = 0; % reset the test
        end 
    end


end

chords = readtable(const.Part4.Chord.Table); % get the table for the chords

% I need to get the notes table because I need to identify the frequencies
notes = readtable(const.Part4.Note.NotesTable);
note_freq = table2array(notes(:,2))'; % get the transpose 2nd col


% Figure out the chord
% first I am going to identify basic chords, with base notes at the lower end of the spectrum 
len = length(chords.name); % Get length 
chorditr = 1; % init iterator 
notename = const.Part4.Chord.DefaultNoteName; % init notename var
for itr 1:len 
    [val,idx] = min(abs(note_freq-chord(1,chorditr))); % use the cell that has the frequency, idx holds the index of the closest frequency

    % Determine which column we are on 
    switch chorditr 
        case 1
            notename = chords(itr,chorditr).p1{1}
        case 2
            notename = chords(itr,chorditr).p2{1}
        case 3
            notename = chords(itr,chorditr).p3{1}
    end

    % compare the name of the note with the one of the notes in each row
    if(notes(idx,1).Var1{1} == notename)

    end
end


% sprintf('   - Chord from .wav file is: %s', string(notes(idx,1).Var1))

