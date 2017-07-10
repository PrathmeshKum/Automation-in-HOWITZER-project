disp('##  Program for getting data in proper format for NN ##');


load('input1_range.mat');
load('input2_wind.mat');
load('output_angle.mat');


for j=1:1:100;
    
  X(1,j)={[realrange7(1,j);wind2(1,j)]};   % For arranging input data in specific format
  T(1,j)={theta7(1,j)};  
end
