function tests_pass = runTestFolder(foldername)
% Runs all tests in a test folder and returns status
%
% Written by weavebj1 on 01/06/2025

% Create a test suite
Test_Tools = testsuite;
Tests = Test_Tools.fromFolder(foldername, 'IncludingSubfolders',true);

% Run the tests
Results = Tests.run();
tests_pass = all([Results.Passed]);

end