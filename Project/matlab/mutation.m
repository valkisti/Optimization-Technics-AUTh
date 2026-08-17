% Mutation Function

function mutated_population = mutation(individual, gsize)
    
    mod_index = randi(gsize);
    
    switch mod(mod_index, 5)
        case 0
            individual(mod_index) = abs(-1 + 2 * rand); % Magnitude of Gaussian
        case 1
            individual(mod_index) = -3 + 7 * rand;      % Center1 [-3,4]
        case 2
            individual(mod_index) = -4 + 7 * rand;      % Center2 [-4,3]
        case 3
            individual(mod_index) = 0.3 + 0.8 * rand;   % Sigma1 [0.3,1.1]
        case 4
            individual(mod_index) = 0.3 + 0.8 * rand;   % Sigma2 [0.3,1.1]
    end

    mutated_population = individual;
end
