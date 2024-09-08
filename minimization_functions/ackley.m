clear all;
close all;
clc;

% Setting the random number generator for reproducibility
% rng default;

% Number of variables (2 for the Ackley function)
nvar = 2;

% Definition of the objective function (Ackley)
f = @(x) -20*exp(-0.2*sqrt(0.5*sum(x.^2))) - exp(0.5*(cos(2*pi*x(1)) + cos(2*pi*x(2)))) + 20 + exp(1);

% Options for the genetic algorithm
options = optimoptions('ga', ...
    'PopulationSize',100, ...
    'EliteCount',4, ...
    'FunctionTolerance',1e-10, ...
    'MutationFcn', {@mutationgaussian, 0.1, 0.9}, ...
    'CrossoverFraction',0.7, ...
    'PlotFcn', {@gaplotbestf, @gaplotscores}, ... % Fitness and Euclidean error plots
    'Display', 'iter', ... % Display output at each iteration
    'MaxStallGenerations',100, ...
    'MaxGenerations', 300); % Maximum number of generations

disp(options);

% Execution of the genetic algorithm
[solution, objectiveValue] = ga(f, nvar, [], [], [], [], [], [], [], options);

% Displaying the results
disp('Found solution:');
disp(solution);

disp('Objective function value:');
disp(objectiveValue);

% Error calculations
minKnown = [0, 0]';
fmin = 0;
ee = norm(solution - minKnown); % Euclidean error
eafo = abs(fmin - objectiveValue); % Absolute objective function error

disp('Euclidean error of the solution:');
disp(ee);

disp('Absolute error of the objective function:');
disp(eafo);

% Creating the Ackley surface plot
%figure;
%fsurf(@(x,y) f([x, y]), [-5, 5]);
%hold on;

%--------------------------------------------------------------------------
% Displaying the point found by the genetic algorithm
%plot3(solution(1), solution(2), objectiveValue, 'ro', 'MarkerSize', 10, 'LineWidth', 2);

% Customizing the plot
%title('Minimization of the Ackley function');
%xlabel('x_1');
%ylabel('x_2');
%zlabel('Ackley Function');
%legend('Ackley Function', 'Found Solution');
%grid on;
%hold off;
