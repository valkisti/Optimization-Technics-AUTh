% Function to calculate the limits of f using linspace

function [min_f, max_f] = limits()
    size = 100;
    fval = zeros(size,size);
    count_x1 = 1;
    for x1 = linspace(-1,2,size)
        count_x2 = 1;
        for u2 = linspace(-2,1,size)
            fval(count_x1,count_x2) = test_f(x1,u2);
        count_x2 = count_x2 + 1;
        end
        count_x1 = count_x1 + 1;
    end
    min_f = min(min(fval));
    max_f = max(max(fval));
end