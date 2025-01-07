%% Check path

% Assume that initPath is kept at the top level
expected_path = fileparts(which('initPath.m'));
assert(strcmp(expected_path, repositoryPath));