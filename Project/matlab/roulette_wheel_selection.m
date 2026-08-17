% Roulette Wheel Selection Function
% Each individual's probability of selection is proportional to its fitness, resembling the spinning of a roulette wheel 
% The higher the fitness, the greater the chance of being selected for reproduction.

function selectedIndices = roulette_wheel_selection(fitness_array, selectionSize)
    totalFitness = sum(fitness_array);
    probabilities = fitness_array / totalFitness;
    cumulativeProbabilities = cumsum(probabilities);
    
    selectedIndices = zeros(1, selectionSize);
    for i = 1:selectionSize
        selectedIndices(i) = find(cumulativeProbabilities >= rand(), 1);
    end
end