clear;
syms x y;

f =@(x,y) x.^3 .* exp(-x.^2-y.^4);
x_0 = -1;              %για x_0 = [-1,0,1]
y_0 = -1;              %για y_0 = [-1,0,1]
e = 0.001;

[k,~,xk, yk] = lavenberg_method(f, x_0, y_0, e,1);
k
figure;
[X,Y]=meshgrid(-2.5:0.1:2.5);
Z= X.^3 .* exp(-X.^2-Y.^4);
contour(X, Y, Z);
hold on;
plot(xk, yk, 'Color', 'r', 'Marker','o');
title('Levenberg-Marquardt method for constant g = 1  starting at (-1,-1)')
xlabel('x') 
ylabel('y') 
grid on;

figure;
i=1:k;
plot(i,f(xk(i),yk(i)));
title('Value of function f for constant g = 1  starting at (-1,-1)')
xlabel('k - interations') 
ylabel('f(xk,yk)') 
grid on;

figure;
i=1:k;
plot(i,xk(i), "Marker","square");
hold on;
plot(i,yk(i), "Marker","o");
legend('x values','y values')
title({'The values of x and y for each interation','for constant g = 1','starting at (-1,-1)'})
xlabel('k - interations')
ylabel('x and y values')
grid on;

[k,~, xk, yk] = lavenberg_method_minimize_g(f, x_0, y_0,e);
k
figure;
[X,Y]=meshgrid(-2.5:0.1:2.5);
Z= X.^3 .* exp(-X.^2-Y.^4);
contour(X, Y, Z);
hold on;
plot(xk, yk, 'Color', 'r', 'Marker','o');
title({'Levenberg-Marquardt method','for g value based on golden section method','starting at (-1,-1)'})
xlabel('x') 
ylabel('y') 
grid on;

figure;
i=1:k;
plot(i,f(xk(i),yk(i)));
title({'Value of function f',' for g value based on golden section method','starting at (-1,-1)'})
xlabel('k - interations') 
ylabel('f(xk,yk)') 
grid on;


figure;
i=1:k;
plot(i,xk(i), "Marker","square");
hold on;
plot(i,yk(i), "Marker","o");
legend('x values','y values')
title({'The values of x and y for each interation','for g value based on golden section method','starting at (-1,-1)'})
xlabel('k - interations')
ylabel('x and y values')
grid on;

[k,~, xk, yk] = lavenberg_method_armijo(f, x_0, y_0, e);
k

figure;
[X,Y]=meshgrid(-2.5:0.1:2.5);
Z= X.^3 .* exp(-X.^2-Y.^4);
contour(X, Y, Z);
hold on;
plot(xk, yk, 'Color', 'r', 'Marker','o');
title({'Levenberg-Marquardt method',' for g based on Armijo Rule',' starting at (-1,-1)'})
xlabel('x') 
ylabel('y') 
grid on;

figure;
i=1:k;
plot(i,f(xk(i),yk(i)));
title({'Value of function f',' for g based on Armijo Rule',' starting at (-1,-1)'})
xlabel('k - interations') 
ylabel('f(xk,yk') 
grid on;

figure;
i=1:k;
plot(i,xk(i), "Marker","square");
hold on;
plot(i,yk(i), "Marker","o");
legend('x values','y values')
title({'The values of x and y for each interation','for g based on Armijo Rule','starting at (-1,-1)'})
xlabel('k - interations')
ylabel('x and y values')
grid on;