% Function to randomly select a span inside our population for the crossover process.

function selected = random_section(population, selections_number)

    % Generate random indices for selection
    data = randi(size(population, 1), 1, selections_number);

    % Select individuals based on the random indices
    selected = population(data, :);
end
