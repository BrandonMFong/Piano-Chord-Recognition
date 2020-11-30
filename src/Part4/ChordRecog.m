% Going to recognize the note that is being played in this audio 
% https://www.mathworks.com/matlabcentral/answers/19970-how-to-see-freq-response-of-a-wave-file 
% https://pages.mtu.edu/~suits/notefreqs.html 
sprintf('NOTE:')

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
chord = [0 0 0]; % init the var that holds the freq
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
            chord(chorditr) = freq(itr);
            amp = ydft(itr);
        else 
            % % break; % get out of the loop if we are decreasing
            % if (chorditr > 3)
            %     break;
            % end
        end
    else
        % break; % get out of the loop if we are decreasing
        if (chorditr > 3)
            break;
        end
        
        % I think I need to do this outside the threshold test because we might still be testing max in that case
        % if the index is 0, then we haven't found the next note
        % but if it is filled, that means we found a frequency
        if(chord(chorditr) ~= 0)
            chorditr = chorditr + 1;
            amp = 0; % reset the test
        end 
    end


end

notes = readtable(const.Part4.Chord.NotesTable);

note_freq = table2array(notes(:,2))';
[val,idx] = min(abs(note_freq-maxval));

sprintf('   - Chord from .wav file is: %s', string(notes(idx,1).Var1))

