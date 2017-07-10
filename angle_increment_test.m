disp('## Program 3: For Angle In Air & Wind Conditions ##');


for L=1:1:q;
    

    
    m=1;
    while le(realrange2(1,L),range1(1,L));
    
    theta3(1,L)=theta3(1,L)+0.5;  
      
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