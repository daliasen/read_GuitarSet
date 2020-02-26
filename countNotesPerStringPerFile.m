function noteCounts = countNotesPerStringPerFile(jamsStructs)

% Inputs:
%   1) jamsStructs - an array of structures containing data from GuitarSet
%       JAMS files
% 
% Outputs:
%   1) noteCounts - an array of matrices containg note counts, dimensions:
%       notes x strings x files, where note index 1 corresponds to 
%            the lowest MIDI note (minNoteMidi) 

uniqueNotesCounts = countUniqueNotes(jamsStructs, [1, 2, 3, 4, 5, 6]);
minNoteMidi = uniqueNotesCounts(1, 1);
maxNoteMidi = uniqueNotesCounts(end, 1);

numFiles = size(jamsStructs, 2);
noteCounts = zeros(maxNoteMidi-minNoteMidi+1, 6, numFiles);
for f=1:numFiles 
    for s=1:6
        uniqueNotesCountsString = countUniqueNotes(jamsStructs(f), s);
        for i=1:size(uniqueNotesCountsString, 1)
            noteMidi = uniqueNotesCountsString(i, 1);
            noteCounts(noteMidi-minNoteMidi+1, s, f) = ...
                uniqueNotesCountsString(i, 2);
        end
    end
end