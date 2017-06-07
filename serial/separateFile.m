% separate_rate is a percentage of data you want from the original data as
% test data
function [random_matrix, remain_matrix] = separateFile(separate_rate)
%Load data from csv
original_data = load('ratings.csv');
%Calculate the size of the original dataset.
[rows, ~] = size(original_data);
%Choose half of the original data
select_num_rows = floor(rows * separate_rate);
%Randomly generate row indexes of original dataset
random_rows = randperm(rows, select_num_rows);
%Generate the random matric using the generated row indexes and the original dataset.
random_matrix = original_data(random_rows,:);
%Get the rest of original dataset removing the random chosen dataset.
remain_matrix = setdiff(original_data, random_matrix, 'rows');
end