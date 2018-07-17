## MC207 Practical File

NOTE: The version of MATLAB® used is v2015b. Syntax may differ while switching to different versions of MATLAB®.


### #1. Formulate and solve Van Der Pol Equation using MATLAB. Plot the graph for the same for different values of Mu. 


```markdown


# Code for Mu=1

type vanderpoldemo 
tspan=[0,20]; 
y0=[2;0]; 
Mu=1; 
ode=@(t,y)vanderpoldemo(t,y,Mu); 
[t,y]=ode45(ode,tspan,y0);

/* Plot of the Solution */
plot(t,y(:,1)) 
xlabel('t') 
ylabel('solution y') 
title('Van Der Pol Equation, \Mu=1')

```
[View Output for Mu=1](https://user-images.githubusercontent.com/21241570/29624967-107157d6-8848-11e7-8743-be74b7b60c58.jpg) 



```markdown


# Code for Mu=10
`
type vanderpoldemo 
tspan=[0,20]; 
y0=[2;0]; 
Mu=10; 
ode=@(t,y)vanderpoldemo(t,y,Mu); 
[t,y]=ode45(ode,tspan,y0);

/* Plot of the Solution */
plot(t,y(:,1)) 
xlabel('t') 
ylabel('solution y') 
title('Van Der Pol Equation, Mu=10')
`
```
[View Output for Mu=10](https://user-images.githubusercontent.com/21241570/29624973-15ab18f4-8848-11e7-89f9-e86f0cb3dec8.jpg)

#

### #2. Write scripts to solve linear ODE with constant coefficients and draw their graphs. 


```markdown

y=dsolve('D2y+Dy=-2*y','y(0)=2','Dy(0)=2');
ezplot(y,[0,20])

```

<hr>


### Contact for Support

This file is dynamically edited according to problems given during practical classes. For any support, write me to <a href="mailto:aviral_bt2k16@dtu.ac.in?" target="_top">aviral_bt2k16@dtu.ac.in.</a>
<br>
###### Aviral Sharma,
###### Department of Applied Mathematics,
###### Delhi Technological University
<hr>
