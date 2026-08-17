% The main algorithm that runs the program

% Parameters
populationSize = 150;
geneSize = 15*5;                               % Adjustable
generations = 10000;
mutationRate = 0.05;                           % Best values of percentages after multiple tests
elitePercentage = 0.3;
diversityPercentage = 0.6;

% Run genetic algorithm
[bestCandidate, bestError] = genetic_algorithm(populationSize, geneSize, generations, mutationRate, elitePercentage, diversityPercentage);

plots(bestCandidate,geneSize,bestError);

% Display the values in table form to be readable

gaussianNames = {'1st Gaussian';'2nd Gaussian';'3rd Gaussian';'4th Gaussian';...
    '5th Gaussian';'6th Gaussian';'7th Gaussian';'8th Gaussian';'9th Gaussian';...
    '10th Gaussian';'11th Gaussian';'12th Gaussian';'13th Gaussian';...
    '14th Gaussian';'15th Gaussian'};
A = bestCandidate(1:5:end)';
center1 = bestCandidate(2:5:end)'; center2 = bestCandidate(3:5:end)';
sigma1 = bestCandidate(4:5:end)'; sigma2 = bestCandidate(5:5:end)'; 
gaussiansTable = table(gaussianNames,A,center1,center2,sigma1,sigma2);
disp(gaussiansTable)
