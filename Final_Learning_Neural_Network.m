disp(' ## Program For Learning Neural Network ## ');

net=network;              % Initiating Network For Learning

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Defining the properties of the Learning Neural Network 

net.numInputs = 1;        % Two Inputs for Wind velocity & Distance of the target
net.numLayers = 3;        % Learning network consists of 3 layers

net.biasConnect(1) = 1;   % Layer 1 has bias connect
net.biasConnect(2) = 1;   % Layer 2 has bias connect
net.biasConnect(3) = 1;   % Layer 3 has bias connect



net.inputConnect(1,1) = 1;     % 1st I/P(wind velocity) is connected to first layer


net.layerConnect = [0 0 0;1 0 0;0 1 0];    % Connecting layers 1, 2, and 3 to layer 3

net.outputConnect = [0 0 1];   % Connecting layer 3 to the learning network output

%(net.numOutputs = 1) Learning network has one Output(Angle of Firing)

net.inputs{1}.size = 2;

net.layers{1}.size = 50;                   % Layer 1 has 50 neurons
net.layers{1}.transferFcn = 'tansig';     % Layer Transfer Function  
net.layers{1}.initFcn = 'initnw';         % Nguyen-Widrow function is the initialization function

net.layers{2}.size = 20;                   % Layer 2 has 20 neurons
net.layers{2}.transferFcn = 'logsig';     % Layer Transfer Function
net.layers{2}.initFcn = 'initnw';         % Nguyen-Widrow function is the initialization function

net.layers{3}.size = 1;                   % Layer 3 has one neuron
net.layers{3}.transferFcn = 'logsig';     % Layer Transfer Function
net.layers{3}.initFcn = 'initnw';         % Nguyen-Widrow function is the initialization function


net.initFcn = 'initlay';        % Initializing network itself according to the layer initialization functions already set to initnw
net.performFcn = 'mse';         % Setting the performance function to mean squared error
net.trainFcn = 'trainlm';       % Setting the training function to Levenberg-Marquardt backpropagation

net.plotFcns = {'plotperform','plottrainstate'};  %Set the plot functions to plotperform (plot training, validation and test performance) and plottrainstate (plot the state of the training algorithm with respect to epochs)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Training the neural network

load('input_vector.mat');
load('output_vector.mat');
                           
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

net=configure(net,X,T);
net=train(net,X,T);