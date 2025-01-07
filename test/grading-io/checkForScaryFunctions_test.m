%% Check this function for bad files
this_file = mfilename('fullpath');
this_file = [this_file, '.m'];
found_bad_functions = checkForScaryFunctions(this_file);

% Function should find the line below this:
% eval(

assert(~found_bad_functions, 'Didn''t find bad functions that are here')