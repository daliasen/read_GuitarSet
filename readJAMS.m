function [data_structs, F] = readJAMS(directory)
% Read all JAM files in a directory and add their contents into an array
%   of structures
%
% Inputs:
%   1) directory - a path to the folder containing JAMS files
%
% Outputs:
%   1) data_structs - an array of structures containing data from JAMS 
%       files in the same order as F
%   2) F - attributes of the JAMS files sorted in ascending order by file 
%       name

F = dir([directory '*.jams']);
[~, order] = sort({F.name});
F = F(order);

numFiles = length(F);

for f = 1:numFiles
    fileID = fopen([directory F(f).name], 'r');
    
    data_json = textscan(fileID, '%c');
   
    fclose(fileID);
    
    data_json = data_json{1:end}; % cell to array
    data_structs(f) = jsondecode(data_json'); % to structure
    disp(['File #' int2str(f)])
end
