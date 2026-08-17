clear 

syms x;
f1 = (x-1)^3 + ((x-4)^2)*cos(x);                                % ορίζουμε τις 3 συναρτήσεις
f2 = exp(-2*x) + (x-2)^2;
f3 = (x^2)*log(0.5*x) + sin((0.2*x)^2);

lamda_values = [0.01, 0.15, 0.5];                               % ορίζουμε τον πίνακα lamda_values ο οποίος έχει για στοιζεία του 3 τιμές για το λ

    for j = 1:length(lamda_values)                              % loop για να περάσουμε από όλες τις τιμές του λ που περιέχει ο πίνακας lamda_values
        lamda = lamda_values(j);                                % ορίζουμε μια μεταβλητή lamda η οποία σε κάθε επανάληψη παίρνει την τιμή που έχει εκείνη τη στιγμη το lamda_values 
        [a, b, k, l] = myfibonacci(f1, lamda);                  % καλούμε τη συνάρτηση myfibonacci

        a_values = zeros(1, k);                                 % ορίζουμε έναν πίνακα a_values με μια γραμμη με στοιχεία 0 που έχει κ στήλες όσες οι επαναλήψεις 
        b_values = zeros(1, k);                                 % όμοια με a_values
        
        for i = 1:k                                             % για κ επαναλήψεις
            a_values(i) = a(i);                                 % κάθε στοιχείο του a_values παίρνει την τιμή του πίνακα a δηλαδή τις τιμές του άκρου a
            b_values(i) = b(i);                                 % κάθε στοιχείο του b_values παίρνει την τιμή του πίνακα b δηλαδή τις τιμές του άκρου b
        end
        
        figure(1)
        colors = jet(length(lamda_values));                     % για να ορίσουμε διαφορετικά χρώματα

        plot(0:k-1, a_values,'Color', colors(j, :),'LineWidth', 1.5)  
        hold on 
        plot(0:k-1, b_values,'Color', colors(j, :),'LineWidth', 1.5);

        xlabel('Iterations (k)');
        ylabel('[a(k), b(k)]');
        title('Fibonacci method: "a" and "b" values in f1');
        grid on;
        legend("Values of a and b for l=0.01"," ","Values of a and b for l=0.15"," ","Values of a and b for l=0.5"," ");
    end

     for j = 1:length(lamda_values)                               % όμοια με 1η συνάρτηση
        lamda = lamda_values(j);
        [a, b, k, l] = myfibonacci(f2, lamda);
        
        a_values = zeros(1, k);
        b_values = zeros(1, k);
        
        for i = 1:k
            a_values(i) = a(i);
            b_values(i) = b(i);
        end
        
        figure(2)
        colors = jet(length(lamda_values));

        plot(0:k-1, a_values,'Color', colors(j, :),'LineWidth', 1.5)  
        hold on 
        plot(0:k-1, b_values,'Color', colors(j, :),'LineWidth', 1.5);

        xlabel('Iterations (k)');
        ylabel('[a(k), b(k)]');
        title('Fibonacci method: "a" and "b" values in f2');
        grid on;
        legend("Values of a and b for l=0.01"," ","Values of a and b for l=0.15"," ","Values of a and b for l=0.5"," ");
    end
  
     for j = 1:length(lamda_values)                                % όμοια με 1η συνάρτηση
        lamda = lamda_values(j);
        [a, b, k, l] = myfibonacci(f3, lamda);
 
        a_values = zeros(1, k);
        b_values = zeros(1, k);
        
        for i = 1:k
            a_values(i) = a(i);
            b_values(i) = b(i);
        end
        
        figure(3)
        colors = jet(length(lamda_values));

        plot(0:k-1, a_values,'Color', colors(j, :),'LineWidth', 1.5)  
        hold on 
        plot(0:k-1, b_values,'Color', colors(j, :),'LineWidth', 1.5);

        xlabel('Iterations (k)');
        ylabel('[a(k), b(k)]');
        title('Fibonacci method: "a" and "b" values in f3');
        grid on;
        legend("Values of a and b for l=0.01"," ","Values of a and b for l=0.15"," ","Values of a and b for l=0.5"," ");
    end
  
  