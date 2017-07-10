disp('## Final Program For Discrete Neural Network Project ##');

for n=[1 5 10 15 20];  % Wind variations will be from 1 to 20 knots with 1 knot increment factor

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%$$$$$
    
disp('## 1st Program: Range & Vacuum angle Finder ##');
            
range=(500:500:7000);                         % range variations will be from 500 to 7000 meters with 130 meters increment factor
theta=(0.5)*asind((range)*(9.81)/(376^2));
range1=[range];
theta1=[theta];
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%$$$$$

disp('## 2nd Program: For Range in Air & Wind Conditions With Vacuum Conditions Angle ##');

%Constants for 155mm shell

c=.152;           %Drag Coefficient of a 155mm shell
rho= 1.288;       %kg/m^3 (density of air)
g=9.81;           %m/s^2 (acceleration due to gravity)

%Initial Conditions



theta2=theta1;
theta3=theta2;
q=length(range1);

wind(1:q)=n;
wind1{n}=wind;
desired_range{n}=range1;

for k = 1:1:q;

delta_t= .01;  %s
x(1)=0  ;
y(1)=0;
V=376;         % m/s     
    
u=V*cosd(theta2(1,k));
v=V*sind(theta2(1,k));
x=0;
y=0;



t(1)=0;        %Start Loop
i=1;
while min(y)> -.001;
ax=-(rho*V*c)/1736.42*(u-(0.5*wind(1,k)));     %  ax=-(rho*V*c)/1362.17*(u-(0.5*(wind velocity in knots)));
ay=(-(rho*V*c)/1736.42)*v-g;
u=u+ax*delta_t;
v=v+ay*delta_t;
V=sqrt(u^2+v^2);
x(i+1)=x(i)+u*delta_t+.5*ax*delta_t^2;
y(i+1)=y(i)+v*delta_t+.5*ay*delta_t^2;
t(i+1)=t(i)+delta_t;
i=i+1;
end

realrange=x(1,i);
realrange1(1,k)=realrange;
realrange2=realrange1;

clear realrange;
clear u v x y t ax ay i V;

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp('## 3rd Program: For Angle In Air & Wind Conditions ##');


for L=1:1:q;
    

    
    m=1;
    while le(realrange2(1,L),range1(1,L));
    
    theta3(1,L)=theta3(1,L)+0.01;                    % Angle increment factor which decides the accuracy required and computation time.
      
    delta_t= .01;  %s
    x(1)=0  ;
    y(1)=0;
    V=376;         % m/s    
    
    u=V*cosd(theta3(1,L));
    v=V*sind(theta3(1,L));
    x=0;
    y=0;
    
    t(1)=0;        %Start Loop 
      
      i=1;
      while min(y)> -.001;
   
      ax=-(rho*V*c)/1736.42*(u-(0.5*wind(1,L)));     %  ax=-(rho*V*c)/1362.17*(u-(0.5*(wind velocity in knots)));
      ay=(-(rho*V*c)/1736.42)*v-g;
      u=u+ax*delta_t;
      v=v+ay*delta_t;
      V=sqrt(u^2+v^2);
      x(i+1)=x(i)+u*delta_t+.5*ax*delta_t^2;
      y(i+1)=y(i)+v*delta_t+.5*ay*delta_t^2;
      t(i+1)=t(i)+delta_t;
      i=i+1;
        
      end
      
    realrange3=x(1,i);
    realrange4(1,m)=realrange3;
    realrange2(1,L)=realrange3;
    theta4(1,m)=theta3(1,L);
    
    clear realrange3 x y u v t ax ay i V;
    m=m+1;
 
    end
 
clear m;
realrange5(1,L)=max(realrange4);
theta5(1,L)=max(theta4);
    

clear realrange4 theta4;

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
realrange6{n}=realrange5;
theta6{n}=theta5;
clear wind realrange5 theta5;

end

wind2=cell2mat(wind1);
realrange7=cell2mat(realrange6);
theta7=cell2mat(theta6);
desired_range1=cell2mat(desired_range);

save('input1_range','realrange7');
save('input2_wind','wind2');
save('output_angle','theta7');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp('## 4th Program: Creating Data Vectors For Training the neural network ##');

b=length(theta7);   % Total number of trajectories computed is stored in the variable b

for j=1:1:b;
    
  X1(1,j)={[realrange7(1,j);wind2(1,j)]};   % For arranging input data in specific format
  T1(1,j)={theta7(1,j)};                    % For arranging output data in specific format
 
end

save('fuzzy_input_vector','X1');
save('fuzzy_output_vector','T1');
clear all;
load('fuzzy_input_vector.mat');
load('fuzzy_output_vector.mat');

disp(' X is the input vector containing range and wind data while T is the output vector containing angle of firing ');
