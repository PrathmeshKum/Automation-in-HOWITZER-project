disp(' ## Program 5: For Learning Network ## ');

% Initiating Network For Learning.
% This is a feed forward backpropagation network.
% The network has 3 layers with 50,20 & 1 neurons respectively, each
% consisting of tansig as activation function.
% Backprop network training function is trainlm.
% Backprop weight/bias learning function is learngdm.
% Performance function is mse.

load('input_vector');
load('output_vector');

net = newff(X,T,[50 20 10],{'tansig' 'tansig' 'tansig' 'tansig'},'trainlm','learngdm','mse');    
net=configure(net,X,T);
net.trainParam.epochs=2000;
net=train(net,X,T);