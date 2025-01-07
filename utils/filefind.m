function out_files = filefind(where_folders, search_str, varargin)
% Find files within a directory
%
% Written by weavebj1 on 01/06/2025


%% Input Handling
mustBeLogical = @(x) assert(islogical(x));

P = inputParser();
P.KeepUnmatched = false;
P.StructExpand = true;

P.addParameter('include_subdirs', false, mustBeLogical);

P.parse(varargin{:});
Opts = P.Results;

if ~iscell(where_folders)
    where_folders = {where_folders};
end

if ~iscell(search_str)
    search_str = {search_str};
end


%% Begin Function

if ispc()
    out_files = searchPcFolder(where_folders, search_str, Opts);

elseif isunix() || ismac()
    error('Mac and Linux calls not yet supported')

else
    error('Invalid OS detected')
end


end


function all_files_found = searchPcFolder(where_folders, search_str, Opts)
    
    all_files_found = {};

    % Create string for windows computers
    for this_folder = where_folders
        
        this_term = fullfile(this_folder, search_str);
        cmd_template = sprintf('dir %s /b', this_term{:});
    
        if Opts.include_subdirs == true
            cmd_template = [cmd_template, ' /s'];
        end
    
        % Run the call
        [~, files_found_str] = system(cmd_template);
        files_found_str = strrep(files_found_str, 'File Not Found', '');
        files_found_str = strtrim(files_found_str);

        % Append to list with full path
        if ~isempty(files_found_str)
            files_found = strsplit(strtrim(files_found_str), '\n');
            files_found = fullfile(this_folder, files_found);
            all_files_found = [all_files_found, files_found];
        end

    end
end
