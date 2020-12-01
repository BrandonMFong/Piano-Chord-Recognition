% only good for 3 size chord
% i would use a for loop and eval() for dynamic sizing
function out = getChordname(chords,itr,index)
    switch index 
        case 1
            out = chords(itr,index).p1{1};
        case 2
            out = chords(itr,index).p2{1};
        case 3
            out = chords(itr,index).p3{1};
    end
end