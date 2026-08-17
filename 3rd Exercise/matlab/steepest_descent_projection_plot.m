clear;
syms x y;                                                                             

f = @(x1, x2) (1/3)*(x1.^2) + 3*(x2.^2);                         
e = 0.01;
x1_min = -10;
x1_max = 5;
x2_min = -8;
x2_max = 12;

[k,x1k,x2k] = steepest_descent_projection(f, 5, -5, e, 0.5, 5, -10, 5, -8, 12);
k
figure;
[X,Y]=meshgrid(-15:0.1:15);
Z = (1/3).*(X.^2) + 3.*(Y.^2);
contour(X, Y, Z);
hold on;
plot(x1k, x2k, 'Color', 'r', 'Marker','o');
hold on;
r = rectangle('position',[x1_min, x2_min, x1_max - x1_min, x2_max - x2_min],  'linestyle', '-', 'edgecolor', 'r',...
    'linewidth', 1.5);
title({'Steepest Descent with projection method','for constant g = 0.5','starting at (5,-5)'})
xlabel('x1') 
ylabel('x2') 
grid on;

figure;
i=1:k;
plot(i,f(x1k(i),x2k(i)));
title({'Value of function f','for constant g = 0.5',' at (5,-5)'})
xlabel('k - interations') 
ylabel('f(x1k,x2k)') 
grid on;

[k,x1k,x2k] = steepest_descent_projection(f, -5, 10, e, 0.1, 3, -10, 5, -8, 12);
k
figure;
[X,Y]=meshgrid(-15:0.1:15);
Z = (1/3).*(X.^2) + 3.*(Y.^2);
contour(X, Y, Z);
hold on;
plot(x1k, x2k, 'Color', 'r', 'Marker','o');
hold on;
r = rectangle('position',[x1_min, x2_min, x1_max - x1_min, x2_max - x2_min],  'linestyle', '-', 'edgecolor', 'r',...
    'linewidth', 1.5);
title({'Steepest Descent with projection method','for constant g = 0.1','starting at (-5,10)'})
xlabel('x1') 
ylabel('x2') 
grid on;

figure;
i=1:k;
plot(i,f(x1k(i),x2k(i)));
title({'Value of function f','for constant g = 0.1',' at (-5,10)'})
xlabel('k - interations') 
ylabel('f(x1k,x2k)') 
grid on;

[k,x1k,x2k] = steepest_descent_projection(f, 8, -10, e, 0.2, 0.1, -10, 5, -8, 12);
k
figure;
[X,Y]=meshgrid(-15:0.1:15);
Z = (1/3).*(X.^2) + 3.*(Y.^2);
contour(X, Y, Z);
hold on;
plot(x1k, x2k, 'Color', 'r', 'Marker','o');
hold on;
r = rectangle('position',[x1_min, x2_min, x1_max - x1_min, x2_max - x2_min],  'linestyle', '-', 'edgecolor', 'r',...
    'linewidth', 1.5);
title({'Steepest Descent method','for constant g = 0.2','starting at (8,-10)'})
xlabel('x1') 
ylabel('x2') 
grid on;

figure;
i=1:k;
plot(i,f(x1k(i),x2k(i)));
title({'Value of function f','for constant g = 0.2',' at (8,-10)'})
xlabel('k - interations') 
ylabel('f(x1k,x2k)') 
grid on;