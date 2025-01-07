function smells_good = checkForScaryFunctions(file)
% Checks for potentially dangerous function calls
%
%   This is for grading purposes. If a student has calls to file I/O or to
%   system calls, that file should be manually checked before using
%
% Written by weavebj1 on 01/06/2025

fid = fopen(file, 'r');
txtData = fscanf(fid, '%s');
fclose(fid);

function_list = {'rmdir', 'delete', 'movefile', 'eval'};

smells_good = true;
for function_call = function_list
    function_str = sprintf('%s(', function_call{:});
    found_function = strfind(txtData, function_str);

    if found_function
        smells_good = false;
        break
    end
end

end