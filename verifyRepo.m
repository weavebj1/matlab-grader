% Run this file before any commits
base_path = repositoryPath();
test_folder = fullfile(base_path, 'test');
addpath(genpath(test_folder));

runTestFolder(test_folder);