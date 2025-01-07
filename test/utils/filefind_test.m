test_dir = repositoryPath();

%% Single File
found_files = filefind(test_dir, 'initPath.m');
passed = true;
err_msg = '';

% Check number of elements
if ~isscalar(found_files)
    passed = false;
    err_msg = [err_msg '\nNumber of files returned was incorrect'];
end

% Check correct file found
[~, file_name] = fileparts(found_files);
if ~strcmp(file_name, 'initPath')
    passed = false;
    err_msg = [err_msg '\nThe incorrect file was found'];
end

assert(passed, err_msg); 


%% Subdirectory search
found_files = filefind(test_dir, 'filefind*.m', 'include_subdirs', true);
passed = true;
err_msg = '';

% Found the original function and this test
[~, file_names] = fileparts(found_files);
found_right_files = all(ismember({'filefind', 'filefind_test'}, file_names));
if ~found_right_files
    passed = false;
    err_msg = [err_msg '\nDid not find the expected files'];
end

% Found at least the right number of files
if numel(found_files) < 2
    passed = false;
    err_msg = [err_msg '\nDid not find enough files'];
end

assert(passed, err_msg); 
