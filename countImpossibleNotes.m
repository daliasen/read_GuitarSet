function numImpossibleNotes = countImpossibleNotes(jamsStructs, numFret)
% Count the notes that don't exist on the guitar neck in standard tuning
%
% Input:
%   1) jamsStructs - an array of structures containing GuitarSet JAMS data
%   2) numFret - number of frets on the guitar neck
%
% Output:
%   1) numImpossibleNotes - the number of impossible notes

numImpossibleNotes = 0;
for string=1:6
    uniqueNotesCountsString = countUniqueNotes(jamsStructs, string);
    
    [fretOpen, fretLast] = noteLimitsString(string, numFret); 
    
    for i=1:size(uniqueNotesCountsString,1)
        if uniqueNotesCountsString(i,1) < fretOpen || ...
           uniqueNotesCountsString(i,1) > fretLast
            numImpossibleNotes = ...
                numImpossibleNotes + uniqueNotesCountsString(i,2);
        end
    end
end