%Constants for 155mm shell
c=.152; %Drag Coefficient of a 155mm shell
rho= 1.288; %kg/m^3 (density of air)
g=9.81; %m/s^2 (acceleration due to gravity)
%Initial Conditions
delta_t= .01; %s
x(1)=0;
y(1)=0;
V=376; %m/s
theta2=max(theta1);
u=V*cosd(theta2);
v=V*sind(theta2);
x=0;
y=0;
t(1)=0; %Start Loop
i=1;
while min(y)> -.001;
    
u1(1,i)=u;
theta3(1,i)=(acosd(u/V));    
ax=-(rho*V*c)/1736.42*(u-(0.5*5));
ay=(-(rho*V*c)/1737)*v-g;
u=u+ax*delta_t;
v=v+ay*delta_t;
V=sqrt(u^2+v^2);
x(i+1)=x(i)+u*delta_t+.5*ax*delta_t^2;
y(i+1)=y(i)+v*delta_t+.5*ay*delta_t^2;
t(i+1)=t(i)+delta_t;i=i+1;
end
realrange=x(1,i);
realrange1=[0 realrange];
plot(x,y);
xlabel('x distance (m)');
ylabel('y distance (m)');
title('Projectile Path');