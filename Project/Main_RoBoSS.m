close all;clear all;clc;

data = readmatrix('diabetes.csv');
indices = (data(:,9) == 0);

data(indices,9) = -1;

row_permuted_indices = randperm(size(data, 1));
% col_permuted_indices = randperm(size(A, 2));

% Shuffle rows and columns of the matrix simultaneously
data = data(row_permuted_indices, :);

Train = data(1:601,:);
Test = data(601:end,:);


%% Set default values for parameters
k = 0.1; % learning rate decay factor
r=0.6; % momentum parameter
max_iter = 1000; % maximum iteration number
t=0;
m=2^5; % mini batch size
a=8.3;  %  a and b are loss parameter
b=6.8;
C=5;  % tradeoff parameter
mew=0.2; % kernel parameter





[gamma_opt,accuracy,valid_time] = RoBoSS_NAG_function(Train,Test,a,b,C,k,r,max_iter,t,m,mew);


 disp(accuracy);

