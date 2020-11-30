function play(filename)
    player = audioplayer(audioread(filename));
    play(player);
end