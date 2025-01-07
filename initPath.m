% Adds this project to your matlab path 
% (don't use repositoryPath function since it might not be on the path yet)
repository_folder = fileparts(mfilename('fullpath'));
addpath(genpath(fullfile(repository_folder, 'grading-io')));
addpath(genpath(fullfile(repository_folder, 'utils')));