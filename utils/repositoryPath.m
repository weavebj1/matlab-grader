function path = repositoryPath()
% Returns the top level directory of the repository

    own_path = fileparts(mfilename('fullpath'));
    git_project = gitrepo(own_path);
    path = char(git_project.WorkingFolder);

end