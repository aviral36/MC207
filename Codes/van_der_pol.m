#For Mu=1

type vanderpoldemo 
tspan=[0,20]; 
y0=[2;0]; 
Mu=1; 

ode=@(t,y)vanderpoldemo(t,y,Mu); 
[t,y]=ode45(ode,tspan,y0); 
 
%Plot of the Solution 
plot(t,y(:,1)) 
xlabel('t') 
ylabel('solution y') 
title('Van Der Pol Equation, \Mu=1')  

#for Mu=10 
type vanderpoldemo 
tspan=[0,20]; 
y0=[2;0]; 
Mu=10; 
ode=@(t,y)vanderpoldemo(t,y,Mu); 
[t,y]=ode45(ode,tspan,y0); 
 
%Plot of the Solution 
plot(t,y(:,1)) 
xlabel('t') 
ylabel('solution y') 
title('Van Der Pol Equation, Mu=10') 

#for Mu=0.15
type vanderpoldemo 
tspan=[0,20]; 
y0=[2;0]; 
Mu=0.15; 
ode=@(t,y)vanderpoldemo(t,y,Mu); 
[t,y]=ode45(ode,tspan,y0); 
 
%Plot of the Solution 
plot(t,y(:,1)) 
xlabel('t') 
ylabel('solution y') 
title('Van Der Pol Equation, Mu=0.15') 
