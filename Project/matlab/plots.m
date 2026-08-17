% Plots Function to plot the results that are shown in the report

function [] = plots(genes,gsize,error)

size = 50;

x1 = linspace(-1, 2, size); 
x2 = linspace(-2, 1, size); 


% Plot of approximation f 
faprroximate = zeros(size,size);
count_x1 = 1;
for i = x1
    count_x2 = 1;
    for j = x2
        faprroximate(count_x1,count_x2) = f_approx(i,j,genes,gsize);
        count_x2 = count_x2 + 1;
    end
    count_x1 = count_x1 + 1;
end
figure(1)
surf(x1,x2,faprroximate);
title('Approximate 3D plot of f');

% Plot of f 

fvalues = zeros(size,size);
count_x1 = 1;
    for i = x1
        count_x2 = 1;
        for j = x2
            fvalues(count_x1,count_x2) = test_f(i,j);
            count_x2 = count_x2 + 1;
        end
        count_x1 = count_x1 + 1;
    end
figure(2)
surf(x1,x2,fvalues)
title('3D plot of f=sin(u1+u2)*sin(u2^2)');

%The error of the approximation (2d and 3d representation ) 

figure(3)
plot(error)
title('Error of the approximation (2D)');

error_values = fvalues - faprroximate;

figure(4)
surf(x1,x2,error_values);
title('Error of the approximation (3D)');

end