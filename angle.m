function realrange2 = angle(~)

wind=(1:5:20);
wind1=[wind];
q=length(wind1);

for k = 1:1:q;

delta_t= .01;  %s
x(1)=0;
y(1)=0;
V=376;         % m/s     



u=V*cosd(theta3(1,k));
v=V*sind(theta3(1,k));
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

realrange3=x(1,i);
realrange2(1,k)=realrange3;


clear realrange3;
clear u v x y t ax ay i V theta3;

end

end