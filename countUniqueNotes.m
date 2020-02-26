function uniqueNotesCounts = countUniqueNotes(jamsStructs, strings)
% List unique MIDI notes that appear in the data structure and count their
%   appearances
%
% Input:
%    1) jamsStructs - an array of structures containing GuitarSet JAMS data 
%    2) strings - an array of string numbers e.g. [1, 2, 3, 4, 5, 6]
%
% Output:
%   1) uniqueNotesCounts - a matrix containing unique MIDI notes (1st column)  
%        and the number of their apperances (2nd column)

strings = strings*2;

allNotes = [];
for f=1:size(jamsStructs, 2) % all files
    for j=1:length(strings)
        s = strings(j);
        for i=1:size(jamsStructs(f).annotations(s).data,1) % number of notes in the data field
            note = round(jamsStructs(f).annotations(s).data(i).value); % midi note
            allNotes = [allNotes note];
        end
    end
end

[uniqueNotes, ~, ic] = unique(allNotes); 
counts = accumarray(ic, 1);
uniqueNotesCounts = [uniqueNotes', counts];