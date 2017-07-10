disp (' ##  Sample Program For DNN Project ## ');


p=(0.1:0.1:50);
t=sin(p);
q=20;

net = newff(minmax(p),[50,1],{'tansig','purelin'},'trainlm');  % Configuring syytem according to the problem
net.trainParam.show = 10;                                     % Setting system parameters 
net.trainParam.lm = 0.01;
net.trainParam.epochs = 200;
net.trainParam.goal = 0.001;
net = train(net,p,t);
y0 = sim(net,p);                                              % Output points are obtained 
plot(p,t,'-',p,y0,'o')                                        % Output and target points are compared
title('Samples of function and NN output after 50 epochs');   % Labelling the graph
xlabel('Input (x)');
ylabel('f(x) Output: - Target: + ');

