%%%%%Module to format image and give 20X20 pixel data
load('ex3data1.mat');
timg=imgformat('three.jpg');

imshow(timg);






%%% Module to recognize the input digit

tdata=reshape(timg,1,[]);
td=im2double(tdata);
td=mapminmax(td,min(min(X).'),max(max(X).'));
load('ex3.mat');
pred=predictOneVsAll(all_theta,td);
fprintf('The predicted digit is %d \n',pred);
