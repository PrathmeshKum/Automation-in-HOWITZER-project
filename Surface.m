disp('## Program 6: For creating 3D plot of the data ##');

% Range,Wind Velocity & Angle Of Firing is ploted

load('input1_range');
load('input2_wind');
load('network3');
load('input_vector');
load('output_vector');

network_angle=sim(net,X);
network_angle=cell2mat(network_angle);

[e,f] = meshgrid(500:5:7000,1:1:20);
z = griddata(realrange7(1,:),wind2(1,:),network_angle,e,f);
mesh(e,f,z);
hold on;
plot3(e,f,z);
xlabel('Range Of The Target');
ylabel('Tail Wind Velocity');
zlabel('Elevation(From neural network)');
title('Elevation As Function Of Range & Tail Wind Velocity');
figure;

T=cell2mat(T);
error=T-network_angle;

y = griddata(realrange7(1,:),wind2(1,:),error,e,f);
mesh(e,f,y);
hold on;
plot3(e,f,y);
xlabel('Range Of The Target');
ylabel('Tail Wind Velocity');
zlabel('Error(From neural network)');
title('Elevation Error As Function Of Range & Tail Wind Velocity');