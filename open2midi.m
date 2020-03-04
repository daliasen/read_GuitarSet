function note_midi = open2midi(string)
% string - string number 1 - low E, 6 - high E (standard tuning)

    switch string
        case 1  % low E
            note_midi = 40;
        case 2
            note_midi = 45;
        case 3
            note_midi = 50;
        case 4
            note_midi = 55;
        case 5
            note_midi = 59;
        case 6 % high E
            note_midi = 64;
        otherwise
            error('no such string')
    end
end