clear 

syms x;
f1 = (x-1)^3 + ((x-4)^2)*cos(x);                                   % ορίζουμε τις 3 συναρτήσεις
f2 = exp(-2*x) + (x-2)^2;
f3 = (x^2)*log(0.5*x) + sin((0.2*x)^2);

lamda_values = linspace(0.005,0.1,50);                             % θέτουμε το lamda_values = linspace ώστε το λ να πάρει διάφορες τιμες
results = zeros(50,3);                                             % ορίζουμε έναν πίνακα results με μέγεθος όσες οι τιμές του λ επί 3 που ειναι οι 3 συναρτησεις
functions = {f1, f2, f3};                                          % ορίζουμε έναν πίνακα functions στοιζεία τις 3 συναρτήσεις μας

for i = 1:3                                                        % loop απο 1 εως 3 για να κάνει interate και στις 3 συναρτήσεις
    for j = 1:length(lamda_values)                                 % loop για να περάσουμε από όλες τις τιμές του λ που θα μας δώσει το linspace 
       lamda = lamda_values(j);                                    % ορίζουμε μια μεταβλητή lamda η οποία σε κάθε επανάληψη παίρνει την τιμή που έχει εκείνη τη στιγμη το lamda_values 
       [a, b, k, l] = bisection_diff(functions{i}, lamda);         % καλούμε τη συνάρτηση bisection_diff
       results(j, i) = k;                                          % αποθηκεύουμε τον αριθμό κ των επαναλήψεων στον πίνακα results
    end                                                            % έτσι κάθε τιμή j δηλαδή κάθε lamda_values της κάθε συνάρτησης (i) θα αντιστοιχεί σε ένα κ
end

figure;
subplot(3,1,1)
plot(lamda_values, results(:, 1), 'r', 'LineWidth', 1.4);
xlabel('l');
ylabel('Number of Iterations');
title('Bisection with derivative method: Number of Iterations vs lamda')
legend('Function 1');
grid on;

subplot(3,1,2)
plot(lamda_values, results(:, 2), 'g', 'LineWidth', 1.4);
xlabel('l');
ylabel('Number of Iterations');
legend('Function 2');
grid on;

subplot(3,1,3)
plot(lamda_values, results(:, 3), 'b', 'LineWidth', 1.4);
xlabel('l');
ylabel('Number of Iterations');
legend('Function 3');
grid on;
