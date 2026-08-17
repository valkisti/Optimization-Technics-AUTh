clear 

syms x;
f1 = (x-1)^3 + ((x-4)^2)*cos(x);                                   %ορίζουμε τις 3 συναρτήσεις
f2 = exp(-2*x) + (x-2)^2;
f3 = (x^2)*log(0.5*x) + sin((0.2*x)^2);

l = 0.01;                                                          % θέτουμε το l = 0.01
epsilon_values = linspace(0.001,0.0049,50);                        % και θέτουμε το epsilon_values = linspace ώστε το ε να πάρει διάφορες τιμες
results = zeros(50,3);                                             % ορίζουμε έναν πίνακα results με μέγεθος όσες οι τιμές του ε επί 3 που ειναι οι 3 συναρτησεις
functions = {f1, f2, f3};                                          % ορίζουμε έναν πίνακα functions στοιζεία τις 3 συναρτήσεις μας

for i = 1:3                                                        % loop απο 1 εως 3 για να κάνει interate και στις 3 συναρτήσεις
    for j = 1:length(epsilon_values)                               % loop για να περάσουμε από όλες τις τιμές του ε που θα μας δώσει το linspace 
       epsilon = epsilon_values(j);                                % ορίζουμε μια μεταβλητή epsilon η οποία σε κάθε επανάληψη παίρνει την τιμή που έχει εκείνη τη στιγμη το epsilon_values
       [a, b, k, e, ~] = mybisection(functions{i}, l, epsilon);    % καλούμε τη συνάρτηση mybisection
       results(j, i) = k;                                          % αποθηκεύουμε τον αριθμό κ των επαναλήψεων στον πίνακα results
    end
end

figure;

subplot(3,1,1)
plot(epsilon_values, results(:, 1), 'r', 'LineWidth', 1.4);
xlabel('Epsilon');
ylabel('Number of Iterations');
title('Bisection Method: Number of Iterations vs epsilon')
legend('Function 1');
grid on;

subplot(3,1,2)
plot(epsilon_values, results(:, 2), 'g', 'LineWidth', 1.4);
xlabel('Epsilon');
ylabel('Number of Iterations');
legend('Function 2');
grid on;

subplot(3,1,3)
plot(epsilon_values, results(:, 3), 'b', 'LineWidth', 1.4);
xlabel('Epsilon');
ylabel('Number of Iterations');
legend('Function 3');
grid on;

