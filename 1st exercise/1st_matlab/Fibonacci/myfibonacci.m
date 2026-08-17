function [a, b, k, l] = myfibonacci(f, lamda)       % αλγόριθμος Fibonacci
    k = 1;                                          % θέτουμε κ=1
    a = [];                                         % ορίζουμε τους πίνακες a, b ,x1, x2
    b = [];
    x1 = [];
    x2 = [];
    a(k) = 0;                                       % ορίζουμε το πρώτο στοιχέιο του a ίσο με το κάτω άκρο του διαστήματος μας 
    b(k) = 3;                                       % ορίζουμε το πρώτο στοιχέιο του b ίσο με το πάνω άκρο του διαστήματος μα
    l = lamda;
    n = 0;                                          % ορίζουμε αρχική τιμή του n=0
    epsilon = 0.001;                                % ορίζουμε ε=0.001

    F = (b(k)-a(k))/l;                              

    while fibonacci(n) <= F                         % υπολογίζουμε τον αριθμό n
        n = n+1;
    end

    x1(k) = a(k) + fibonacci(n-2)/fibonacci(n)*(b(k)-a(k));              % υπολογίζoυμε το x11
    x2(k) = a(k) + fibonacci(n-1)/fibonacci(n)*(b(k)-a(k));              % υπολογίζoυμε το x21

   % f_x1 = eval(subs(f, x1(k)));                                         % υπολογίζoυμε το f(x11)
    %f_x2 = eval(subs(f, x2(k)));                                         % υπολογίζoυμε το f(x21)
   
    while true                                  % while loop ώστε από το βήμα 4 να ,πορώ να ξαναεπιστρέψω στο βήμα 1
        if subs(f, x1(k)) > subs(f, x2(k))                          % Βήμα 1
            a(k+1) = x1(k);                     % Βήμα 2 
            b(k+1) = b(k);
            x1(k+1) = x2(k);
            x2(k+1) = a(k+1) + fibonacci(n-k-1)/fibonacci(n-k)*(b(k+1)-a(k+1));
            if k == n-2                         % αν k == n-2 πάω στο βήμα 5 το οποίο είναι παρακάτω
                x1(n) = x1(n-1);
                x2(n) = x1(n-1) + epsilon;
                if subs(f, x1(n) > subs(f, x2(n)))
                    a(n) = x1(n);
                    b(n) = b(n-1);
                else
                    a(n) = a(n-1);
                    b(n) = x2(n);
                end
                break                              % ο αλγόρθμος τερματίζει και στις 2 περιπτώσεις του βήματος 5
            else
                k = k+1;                           % αν δεν ισχύει k == n-2 πάω στο βήμα 4, θέτω k = k+1, υπολογίζω το f_x2
                %f_x2 = eval(subs(f, x1(k)));       % και επιστρέφω στο βήμα 1 μέσω του continue
                continue
            end
        else                                       % Βήμα 3 : αν f_x1 < f_x2
            a(k+1) = a(k);
            b(k+1) = x2(k);
            x2(k+1) = x1(k);
            x1(k+1) = a(k+1) + fibonacci(n-k-2)/fibonacci(n-k)*(b(k+1)-a(k+1));
            if k == n-2                            % αν k == n-2 πάω στο βήμα 5 το οποίο είναι παρακάτω
                 x1(n) = x1(n-1);
                 x2(n) = x1(n-1) + epsilon;
                 if subs(f, x1(n)) > subs(f, x2(n))
                     a(n) = x1(n);
                     b(n) = b(n-1);
                 else
                     a(n) = a(n-1);
                     b(n) = x2(n);
                 end
                 break                            % ο αλγόρθμος τερματίζει και στις 2 περιπτώσεις του βήματος 5
            else
                k = k + 1;                        % αν δεν ισχύει k == n-2 πάω στο βήμα 4, θέτω k = k+1, υπολογίζω το f_x1
                continue                          % και επιστρέφω στο βήμα 1 μέσω του continue continue
            end
        end
    end




