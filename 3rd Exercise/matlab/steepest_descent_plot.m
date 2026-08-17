clear;
syms x y;                                                                             

f = @(x1, x2) (1/3)*(x1.^2) + 3*(x2.^2);
x1_0 =3;                         
x2_0 =4;                          
e = 0.001;

[k,~,x1k,x2k] = steepest_descent(f, x1_0, x2_0, e, 5);                         %	γ_k = 0.1 , 0.3 , 3 ,5 
k
figure;
[X,Y]=meshgrid(-5:0.1:5);
Z = (1/3).*(X.^2) + 3.*(Y.^2);
contour(X, Y, Z);
hold on;
plot(x1k, x2k, 'Color', 'r', 'Marker','o');
title({'Steepest Descent method','for constant g = 5','starting at (3,4)'})
xlabel('x1') 
ylabel('x2') 
grid on;

figure;
i=1:k;
plot(i,f(x1k(i),x2k(i)));
title({'Value of function f','for constant g = 5',' at (3,4)'})
xlabel('k - interations') 
ylabel('f(x1k,x2k)') 
grid on;
