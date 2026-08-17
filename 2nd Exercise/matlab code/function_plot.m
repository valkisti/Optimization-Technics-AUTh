f = @(x, y) (x.^3) .* exp((-x.^2) - (y.^4));                          % Ορίσμός της συνάρτησης 

[x, y] = meshgrid(-5:0.1:5, -5:0.1:5);                                

z = f(x, y);

figure;                                                        % Φτιάχνει ενα 3D διάγραμμα της συνάρτησης 
subplot(1,2,1)
surf(x, y, z);
xlabel('X-axis');
ylabel('Y-axis');
zlabel('Z-axis');
title(' 3D διάγραμμα της f = exp(-x^2 - y^4)');

subplot(1,2,2)                                                % Και φτιάχνει και τις ισουψείς καμπύλες της
fcontour(f,[-3 3]);
grid on;
title('Ισοϋψείς καμπύλες της f = exp(-x^2 - y^4)');
xlabel('x');
ylabel('y');
