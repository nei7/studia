clc; clear; close all;

full_path = mfilename('fullpath');
[script_dir, ~, ~] = fileparts(full_path);

cd(script_dir);


output_dir = '../assets/';

if ~exist(output_dir, 'dir')
    mkdir(output_dir);
end


krok1;
