disp('## 2nd Program: For Range in Air & Wind Conditions With Vacuum Conditions Angle ##');

%Constants for 155mm shell

c=.152;           %Drag Coefficient of a 155mm shell
rho= 1.00649;     %kg/m^3 (density of air)
g=9.81;           %m/s^2 (acceleration due to gravity)

%Initial Conditions



theta2=theta1;
q=length(wind1);
  
for k = 1:1:q;

delta_t= .01;  %s
x(1)=0;
y(1)=0;
V=376;         % m/s     
    
u=V*cosd(theta2(1,k));
v=V*sind(theta2(1,k));
x=0;
y=0;



t(1)=0;        %Start Loop
i=1;
while min(y)> -.001;
ax=-(rho*V*c)/1362.17*(u-(0.5*wind1(1,k)));     %  ax=-(rho*V*c)/1362.17*(u-(0.5*(wind velocity in knots)));
ay=(-(rho*V*c)/1362.17)*v-g;
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

clear realrange;
clear u v x y t ax ay i V;

end
