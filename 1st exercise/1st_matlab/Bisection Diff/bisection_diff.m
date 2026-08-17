function [a, b, k, l] = bisection_diff(f, lamda)
    k = 1;
    a = [];
    b = [];
    a(k) = 0;
    b(k) = 3;
    l = lamda;
    n = 0;

    while (1/2)^n > l/(b(k)-a(k))             % υπολογίζω τον αριθμό n ο οποίος είναι ο μικρότερος ακέραιος που ικανοποιεί την σχέση (1/2)^n < l/(b(k)-a(k)) 
        n = n+1;
    end
    
    syms x;                                   % Ορίζω το x ως μια symbolic μεταβλητή

    while true
        x_val = (a(k)+b(k))/2;
        dy = diff(f, x);                      % Παραγωγίζω την f ως προς x
        dy_val = subs(dy, x, x_val);          % Αντικαθιστώ το x με την τιμή x_val
        
        if dy_val == 0                        % Αν το dy_val == 0 τότε το xk είναι το σημείο ελαχίστου
            break;
        elseif dy_val > 0                     % Αν dy_val > 0 το ελάχιστο εμφανίζεται αριστερά του xk
            a(k+1) = a(k);
            b(k+1) = x_val;
            if k == n                         % Αν k == n τότε το ελάχιστο ανήκει στο [a(n+1),b(n+1)]
                break;
            else
                k = k+1;                      % Διαφορετικά πηγαίνω στο Βήμα 1 μέσω του continue
                continue;
            end
        else                                  % Αν dy_val < 0 το ελάχιστο εμφανίζεται δεξιά του xk
            a(k+1) = x_val;
            b(k+1) = b(k);
            if k == n                         % Αν k == n τότε το ελάχιστο ανήκει στο [a(n+1),b(n+1)]
                break;
            else
                k = k+1;                      % Διαφορετικά πηγαίνω στο Βήμα 1 μέσω του continue
                continue;
            end
        end
    end
end

