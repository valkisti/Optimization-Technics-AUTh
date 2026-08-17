function [best, bestFitness] = genetic_algorithm(populationSize, geneSize, generations_num, mutationRate, elitePercentage, diversityPercentage)
    % Calculate the number of individuals in the elite group
    eliteSize = round(elitePercentage * populationSize);
    
    % Calculate the number of individuals for diversity
    diversitySize = round(diversityPercentage * populationSize);

    % Initialize best individuals and their fitness
    bestFitness = inf(generations_num, 1);
    bestIndividuals = zeros(generations_num, geneSize);
    best = zeros(1, geneSize);

    % Generate initial population that are not totally random but based on some original values that we select
    x1Lims = [-3 4]; 
    x2Lims = [-4 3];
    [minf,maxf] = limits();
    genes = zeros(1,geneSize);
    for j = 1:populationSize
        for i = 1:5:geneSize
            genes(i) = minf + (maxf - minf)*rand;                   %magnitude
            genes(i+1) = x1Lims(1) + (x1Lims(2) - x1Lims(1))*rand;  %center1
            genes(i+2) = x2Lims(1) + (x2Lims(2) - x2Lims(1))*rand;  %center2
            genes(i+3) = 0.3 + 0.8 * rand;                          %sigma1 
            genes(i+4) = 0.3 + 0.8* rand;                           %sigma2
        end
        population(j,1:geneSize) = genes;
    end

    for gen = 1:generations_num

        % Calculate fitness for each individual in the population
        fitness_array = zeros(populationSize, 1);
        for i = 1:populationSize
            fitness_array(i) = fitness(population(i, :), geneSize);
        end

        % Sort the entire population based on fitness (ascending order)
        [~, sortedIndices] = sort(fitness_array);
        population = population(sortedIndices, :);

        % Elitism Mechanism
        elitePopulation = population(1:eliteSize, :);

        % Roulette Wheel Selection for the rest of the population
        rouletteSelectionSize = populationSize - eliteSize - diversitySize;
        selectedIndices = roulette_wheel_selection(fitness_array(eliteSize+1:end), rouletteSelectionSize);
        rouletteSelection = population(eliteSize + selectedIndices, :);

        % Diversity Mechanism (Random Selection)
        diversityPopulation = random_section(population(eliteSize+rouletteSelectionSize+1:end, :), diversitySize);

        % Combine the elite, roulette-selected, and diverse individuals
        newPopulation = [elitePopulation; rouletteSelection; diversityPopulation];

        % Crossover
        crossoverPairs = random_section(newPopulation, populationSize);
        for i = 1:size(crossoverPairs, 1)
            parentA = crossoverPairs(i, :);
            parentB = crossoverPairs(mod(i, size(crossoverPairs, 1)) + 1, :);
            child = crossover(parentA, parentB);
            newPopulation(i + eliteSize, :) = child;
        end

        % Mutation
        for i = 1:populationSize
            if rand() < mutationRate
                newPopulation(i, :) = mutation(newPopulation(i, :), geneSize);
            end
        end

        % Update the population for the next generation
        population = newPopulation;

        % Recalculate fitness after crossover and mutation
        for i = 1:populationSize
            fitness_array(i) = fitness(population(i, :), geneSize);
        end

        % Update the best individuals if better ones are found
        [~, bestIdx] = min(fitness_array);
        bestFitness(gen) = fitness_array(bestIdx);
        bestIndividuals(gen, :) = population(bestIdx, :);

    end

    % Display the final result
    disp('Final Result:');
    [~, bestIdx] = min(bestFitness);
    best = bestIndividuals(bestIdx, :);
    disp(['Best Fitness: ', num2str(bestFitness(bestIdx))]);
    disp(['Best Individual: ', num2str(best)]);
end
