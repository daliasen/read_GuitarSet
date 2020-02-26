function [fretOpen, fretLast] = noteLimitsString(string, numFret)
% Get the lowest (open) and the highest MIDI notes on a string of a 
%   guitar in standard tuning
%
% Input:
%   1) string - int 1-6 (1 - low E, 6 - high E)
%   2) numFret - number of frets on the guitar

% Output:
%   1) fretOpen - lower limit, MIDI
%   2) fretLast - upper limit, MIDI

switch(string)
        case 1 % low E
            fretOpen = 40;
            fretLast = fretOpen + numFret;
        case 2
            fretOpen = 45;
            fretLast = fretOpen + numFret;
        case 3
            fretOpen = 50;
            fretLast = fretOpen + numFret;
        case 4
            fretOpen = 55;
            fretLast = fretOpen + numFret;
        case 5
            fretOpen = 59;
            fretLast = fretOpen + numFret;
        case 6 % high E
            fretOpen = 64;
            fretLast = fretOpen + numFret;
        otherwise
            error('no such string')
end