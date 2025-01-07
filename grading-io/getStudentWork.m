function [student_files] = getStudentWork(folder, assignment_name)
% Returns a list of student files from a directory given an assignment name
%
%   A simple wrapper that uses a concrete format to pull student work for a
%   given assignment
%
% Written by weavebj1 on 01/06/2025

search_str = [assignment_name, '_*'];
student_files = filefind(folder, search_str);

end