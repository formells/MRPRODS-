% Definition of Variables
x1 = optimvar('x1','LowerBound',0,'UpperBound',Inf);
% Represents the area dedicated to the customers in square meters

x2 = optimvar('x2','LowerBound',0,'UpperBound',Inf);
% Represents the area dedicated to the kitchen in square meters

x3 = optimvar('x3','LowerBound',0,'UpperBound',Inf);
% Represents the number of servers

x4 = optimvar('x4','LowerBound',0,'UpperBound',Inf);
% Represents the number of chefs

x5 = optimvar('x5','LowerBound',0,'UpperBound',Inf);
% Represents the number of cooks

x6 = optimvar('x6','LowerBound',0,'UpperBound',Inf);
% Represents the number of managers

x7 = optimvar('x7','LowerBound',0,'UpperBound',Inf);
% Represents the number of supervisors

x8 = optimvar('x8','LowerBound',0,'UpperBound',Inf);
% Represents the number of menu created

x9 = optimvar('x9','LowerBound',0,'UpperBound',Inf);
% Represents instances of designing and constructing

x10 = optimvar('x10','LowerBound',0,'UpperBound',Inf);
% Represents a set of permits

x11 = optimvar('x11','LowerBound',0,'UpperBound',Inf);
% Represents branding

% Mean Cost
obj = 40000*x1 + 40000*x2 + 126600*x3 + 555000*x4 + 129000*x5 + 165000*x6 + 99000*x7 + 300000*x8 + 9000000*x9 + 150000*x10 + 300000*x11;
prob = optimproblem('Objective', obj, 'ObjectiveSense', 'min');

% Constraint
prob.Constraints.c1 = 20*x1 >= 40; 
prob.Constraints.c2 = x2 >= 40; 
prob.Constraints.c3 = 20*x3 >= 40; 
prob.Constraints.c4 = x4 >= 1; 
prob.Constraints.c5 = 10*x4 + 10*x5 >= 40; 
prob.Constraints.c6 = 35000*x4 + 18000*x5 >= 0; 
prob.Constraints.c7 = x6 >= 1; 
prob.Constraints.c8 = x7 >= 1; 
prob.Constraints.c9 = x8 >= 1; 
prob.Constraints.c10 = x9 >= 1; 
prob.Constraints.c11 = x10 >= 1; 
prob.Constraints.c12 = x11 >= 1; 

% Convert to structs
problem = prob2struct(prob);

% Solve the problem
[sol, fval, exitflag, output] = linprog(problem);

% Displays the fval
disp('Objective Function Value:');
disp(fval);
