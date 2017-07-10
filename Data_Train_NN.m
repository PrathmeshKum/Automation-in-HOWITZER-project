disp(' ## Test Program For Discrete Neural Network Project ## ');

net=network;              % Initiating Network For Learning

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Defining the properties of the Learning Neural Network 

net.numInputs = 2;        % Two Inputs for Wind velocity & Distance of the target
net.numLayers = 3;        % Learning network consists of 3 layers

net.biasConnect(1) = 1;   % Layer 1 has bias connect
net.biasConnect(2) = 1;   % Layer 2 has bias connect
net.biasConnect(3) = 1;   % Layer 3 has bias connect


net.inputConnect(1,1) = 1;     % 1st I/P(wind velocity) is connected to first layer
net.inputConnect(1,2) = 1;     % 2nd I/P(target distance) is connected to first layer

net.layerConnect = [0 0 0;1 0 0;0 1 0];    % Connecting layers 1, 2, and 3 to layer 3

net.outputConnect = [0 0 1];   % Connecting layer 3 to the learning network output

%(net.numOutputs = 1) Learning network has one Output(Angle of Firing)

net.inputs{1}.size = 1;        % 1st I/P(wind velocity) has one element in the vector
net.inputs{2}.size = 1;        % 2nd I/P(target distance) has one element in the vector

net.layers{1}.size = 2;                   % Layer 1 has two neurons
net.layers{1}.transferFcn = 'tansig';     % Layer Transfer Function  
net.layers{1}.initFcn = 'initnw';         % Nguyen-Widrow function is the initialization function

net.layers{2}.size = 1;                   % Layer 2 has one neuron
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

x11=[1 1 1 1 1 1 1 1 1 1 1 1 1 1];                     % Wind Velocities
x12=[5 5 5 5 5 5 5 5 5 5 5 5 5 5];
x13=[10 10 10 10 10 10 10 10 10 10 10 10 10 10];
x14=[15 15 15 15 15 15 15 15 15 15 15 15 15 15];
x15=[20 20 20 20 20 20 20 20 20 20 20 20 20 20];

x21=[500 1000 1500 2000 2500 3000 3500 4000 4500 5000 5500 6000 6500 7000];                   % Distance of the target

t1=[1.044 2.189 3.387 4.689 6.145 7.708 9.428 11.36 13.5 15.95 18.82 22.35 27.05 36.48];      % Angle of firing
t2=[1.044 2.189 3.387 4.689 6.145 7.708 9.428 11.36 13.5 15.95 18.77 22.27 26.9 35.9];
t3=[1.044 2.189 3.387 4.689 6.145 7.7 9.4 11.3 13.45 15.85 18.69 22.15 26.7 34.78];
t4=[1.044 2.189 3.387 4.689 6.115 7.667 9.368 11.26 13.39 15.79 18.62 22 26.44 34.02];
t5=[1.054 2.189 3.367 4.669 6.1 7.64 9.34 11.24 13.36 15.75 18.54 21.9 26.21 33.4];

X = {x11 x12 x13 x14 x15;x21 x21 x21 x21 x21};         % Input Vector
T = {t1 t2 t3 t4 t5};                                  % Output Vector 

net=train(net,X,T);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

