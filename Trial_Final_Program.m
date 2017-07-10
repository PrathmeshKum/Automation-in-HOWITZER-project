disp('## Final Program ##');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%$$$$$

disp('## 1st Program: Range & Vacuum angle Finder ##');

% Increament factor of wind matrix multipied by 342.1053 gives range increament factor for equal dimensions

wind=(1:5:20);             
range=(500:1710.5265:7000);
theta=(0.5)*asind((range)*(9.81)/(376^2));
range1=[range];
theta1=[theta];
wind1=[wind];  

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%$$$$$

disp('## 2nd Program: For Range in Air & Wind Conditions With Vacuum Conditions Angle ##');

%Constants for 155mm shell

c=.152;           %Drag Coefficient of a 155mm shell
rho= 1.00649;     %kg/m^3 (density of air)
g=9.81;           %m/s^2 (acceleration due to gravity)

%Initial Conditions



theta2=theta1;
theta3=theta2;
q=length(wind1);
  
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
realrange2=realrange1;

clear realrange;
clear u v x y t ax ay i V;

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp('## Program 3: For Angle In Air & Wind Conditions ##');


for L=1:1:q;
    

    
    m=1;
    while le(realrange2(1,L),range1(1,L));
    
    theta3(1,L)=theta3(1,L)+0.01;  
      
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
   
      ax=-(rho*V*c)/1362.17*(u-(0.5*wind1(1,L)));     %  ax=-(rho*V*c)/1362.17*(u-(0.5*(wind velocity in knots)));
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

