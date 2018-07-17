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

<br>

### #2. Write scripts to solve linear ODE with constant coefficients and draw their graphs. 


```markdown

y=dsolve('D2y+Dy=-2*y','y(0)=2','Dy(0)=2');
ezplot(y,[0,20])

```


<br>

### #3. Write a program to find the solutions of the equation x=Ax using eigenvalues and eigenvector.


```markdown

%%linear_DE_solver:Solve a system of linear Homogenous DEs
function[sols]=linear_DE_system_solver(A)
syms t
syms lambda
n=length(A);
[V,D]=eig(A);
eignvalues=diag(D);
consts=reshape(sym('c%d',1:n),n,1);
unique_eignvalues=unique(eignvalues);
        mults=histc(eignvalues,unique_eignvalues);
        sols=sym('x%d',[1 n]);
        if length(unique_eignvalues)~=length(eignvalues)
            i=1;
            ch_mat=A-lambda*eye(n);
            V=vpa(V);
            while i<=n
                [pos]=find(unique_eignvalues == eignvalues(i));
                if mults(pos)>1
                    e_vector=V(:,i);
                    a_mat=subs(ch_mat,eignvalues(i));
                    for j=1:mults(pos)
                        V(:,i)=V(:,i).*(t^(j-1));
                        P=inv(a_mat^(j-1)+e_vector);
                        V(:,i) = V(:, i)+p;
                        i=i+1;
                    end;
                else
                    i=i+1;
                end;
            end;
        end;
        for i=1:n
        sols(i) = (V(i, :).*exp(eignvalues'*t)) *consts;
        end;

```

<br>

### #4. Write a program to solve initial value problem using eigenvalue-eigenvector method.



```markdown

function [sols,vals]= linear_de_ivp_solver(A,B,C)
        syms t lambda
        n=length(A);
        [v,D]=eig(A);
        eignvalues=diag(D);
        consts=reshape(sym('c%d',1:n),n,1);
        unique_eignvalues=unique(eignvalues);
        mults=hist(eignvalues,unique_eignvalues);
        sols=sym('x%d',[1 n]);
        if length(unique_eignvalues)~=length(eignvalues)
            i=1;
            ch_mat=A-lambda*eye(n);
            v=vpa(v);
            while i<=n
                [pos]=find(unique_eignvalues == eignvalues(i));
                if mults(pos)>1
                    e_vector=V(:,i);
                    a_mat=subs(ch_mat,eignvalues(i));
                    for j=1:mults(pos)
                        v(:,i)=V(:,i).*(t^(j-1));
                        P=inv(a_mat^(j-1)+e_vector);
                        v(:,i) = v(:, i)+p;
                        i=i+1;
                    end;
                else
                    i=i+1;
                end;
            end;
        end;
        for i=1:n
        sols(i) = (v(i, :).*exp(eignvalues'*t)) *consts;
        end;
        vals= solve(subs(sols, t, B) ==C);
        constnames = fieldnames(vals);
        for i=1:n
            sols = subs(sols, consts(i),vals.(constnames{i}));
        end;


```


<hr>


### Contact for Support

This file is dynamically edited according to problems given during practical classes. For any support, write me to <a href="mailto:aviral_bt2k16@dtu.ac.in?" target="_top">aviral_bt2k16@dtu.ac.in.</a>
<br>
###### Aviral Sharma,
###### Department of Applied Mathematics,
###### Delhi Technological University
<hr>
