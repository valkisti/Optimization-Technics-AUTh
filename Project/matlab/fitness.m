% Fitness function on the genetci algorithm

function fit = fitness(genes,size)

x1Lims = [-1 2];
x2Lims = [-2 1];

val = 0;
points = 25;
n = points^2;
for u1 = linspace(x1Lims(1),x1Lims(2),points)
    for u2 = linspace(x2Lims(1),x2Lims(2),points)
    val = val + (test_f(u1,u2) - f_approx(u1,u2,genes,size))^2;
    end
end
fit = val/n;       % mean square error (mse)
end