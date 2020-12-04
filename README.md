# Piano Chord Recognition
Piano chord recognition is a subset procedure of Automatic Music Transcription (AMT).  AMT is the process of analysis on a musical piece and creating a score from that analysis.  In this project, chord recogntion is accomplished by analyzing the frequency spectrum of a .wav file.  The .wav files contain a 3 note Major/Minor chord.  The frequency analysis identifies the first 3 maximum peaks and its frequency index.  With the frequency index ('A' note above middle C is 440 Hz), the note name can be determined. And with the three note names, the chord name can be determined. 

This repository holds matlab scripts of a final project during one of my semesters in graduate school.  The piano chord recognition section is in this path: /src/Part4/main.m.  The other scripts are preliminary problems for discrete fourier transform.  

# Process
## Select wave file
You can choose any of the files I produced or any files you would like to test, so long as they reside in the /wav/ directory.  Make sure the wave file only plays one 3-note chord (G minor: G+Bb+D).  The tempo and bpm do not matter. 

![chord config](https://github.com/BrandonMFong/Piano-Chord-Recognition/blob/main/img/chord_config.PNG)

## Run Matlab Script driver.m
Assuming every script reference is commented out but the "main" one, you will see a figure of the chord's spectrum.

### Spectrum 
![chord spectrum](https://github.com/BrandonMFong/Piano-Chord-Recognition/blob/main/img/chord_spectrum.PNG)

### Frequency Table
Column 1 is the note, column 2 is the frequency, and column 3 is the wavelength. 

![note frequency and wavelength](https://github.com/BrandonMFong/Piano-Chord-Recognition/blob/main/img/freq_table.PNG)

### Matlab Outcome
Plain text confirming that the algorithm came to a conclusion on what the chord is. 
![matlab output](https://github.com/BrandonMFong/Piano-Chord-Recognition/blob/main/img/matlab_output.PNG)

# Author
**[Brandon Fong](https://www.brandonmfong.com)**
