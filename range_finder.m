disp('## 1st Program: Range & Vacuum angle Finder ##');

% Increament factor of wind matrix multipied by 342.1053 gives range increament factor for equal dimensions

wind=(1:5:20);             
range=(500:1710.5265:7000);
theta=(0.5)*asind((range)*(9.81)/(376^2));
range1=[range];
theta1=[theta];
wind1=[wind];       