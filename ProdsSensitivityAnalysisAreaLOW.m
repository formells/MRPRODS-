% Define a range of values for the cost coefficients (Low, Mean, High)
cost_values = [35000, 40000, 45000];

% Initialize arrays to store results
sensitivity_results = zeros(length(cost_values), 1);

% Perform sensitivity analysis
for i = 1:length(cost_values)
    % Update the objective function with the new cost coefficients
    obj = cost_values(i)*x1 + cost_values(i)*x2 + 90600*x3 + 210000*x4 + 108000*x5 + 120000*x6 + 90000*x7 + 300000*x8 + 9000000*x9 + 150000*x10+ 300000*x11;
    prob = optimproblem('Objective', obj, 'ObjectiveSense', 'min');
    
    % Add constraints (assuming they remain the same)
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

    % Store the objective function value
    sensitivity_results(i) = fval;
end

% Display sensitivity analysis results
for i = 1:length(cost_values)
    fprintf('Cost Level: %d, Objective Function Value: %.2f\n', cost_values(i), sensitivity_results(i));
end
