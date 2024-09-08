clear all;
close all;
clc;

% Setting the random number generator for reproducibility
% rng default;

% Number of variables (2 for the Rastrigin function)
nvar = 2;

% Definition of the objective function (Rastrigin)
f = @(x) 20 + sum(x.^2 - 10*cos(2*pi*x));

% Options for the genetic algorithm
options = optimoptions('ga', ...
    'PopulationSize',150, ...
    'EliteCount',6, ...
    'MutationFcn', {@mutationgaussian, 0.3, 0.9}, ...
    'CrossoverFraction',0.7, ...
    'FunctionTolerance',1e-10, ...
    'PlotFcn', {@gaplotbestf, @gaplotscores}, ... % Fitness and Euclidean error plots gaplotbestindiv
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

% Creating the Rastrigin surface plot
%figure;
%fsurf(@(x,y) f([x, y]), [-5.12, 5.12]);
%hold on;

%--------------------------------------------------------------------------
% Displaying the point found by the genetic algorithm
%plot3(solution(1), solution(2), objectiveValue, 'ro', 'MarkerSize', 10, 'LineWidth', 2);

% Customizing the plot
%title('Minimization of the Rastrigin function');
%xlabel('x_1');
%ylabel('x_2');
%zlabel('Rastrigin Function');
%legend('Rastrigin Function', 'Found Solution');
%grid on;
%hold off;
