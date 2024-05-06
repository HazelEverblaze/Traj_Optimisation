 clc;
clear;

% n  T(min)  t1(min) t2(min)  t3(min)  mb1    mb2    mb3
lb = [1e2,    10,     15,    30.1,  0.001 ,  0.001, 0.001]; % lower bounds
ub = [1e2,    10,      15,      60,    +1.,    +1.,  +1.]; % upper bounds

options = optimoptions('gamultiobj', "PlotFcn","gaplotpareto", 'PopulationSize', 1000, ...
    'ConstraintTolerance',1e-2,'MaxGenerations',10000,'MaxStallGenerations',1000,'FunctionTolerance',1e-4);

[x, fval] = gamultiobj(@(x) evalobj(x), 7, [],[],[],[], lb, ub, [] ,options); 
% constraints, no. of variables, linear inequalities & equality constraints, lower bounds, upper bounds, nonlinear constraints, optimisation

%output [x,fval]= [(T, t1,t2,mb1,mb2), (obj1(ecc),obj2(fuel))]

%% v this is the part that takes random numbers between lb and ub 
x = [x,fval];

[dmy,I] = sort(x(:,8)); %sort based on output 6

x = x(I,:); %all elements into I

x(1:10,:) % picks 10 best outputs in order