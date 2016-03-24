
clear ; close all; clc


input_layer_size  = 400;  
num_labels = 10;          


%

% Load Training Data
fprintf('Loading Data ...\n')

load('ex3data1.mat'); % training data stored in arrays X, y
m = size(X, 1);
J=zeros(5000,400);
for i=1:m
J(i,:)=editim(X(i,:));
end
X=J;

fprintf(' Press enter to continue.\n');
pause;


fprintf('\nTraining One-vs-All Logistic Regression...\n')

lambda = 0.05;
[all_theta] = oneVsAll(X, y, num_labels, lambda);
save('ex3.mat','all_theta');
fprintf('Press enter to continue.\n');
pause;



pred = predictOneVsAll(all_theta, X);

fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == y)) * 100);



