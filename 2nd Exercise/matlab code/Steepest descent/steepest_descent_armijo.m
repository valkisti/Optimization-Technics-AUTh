function [k, d, g, x, y] = steepest_descent_armijo(x_0, y_0, f, e)
    syms x y;

    df_dx = diff(f, x);                                     %υπολογισμός των παραγώγων
    df_dy = diff(f, y);
    grad_f = @(x_val, y_val) [double(subs(df_dx, [x, y], [x_val, y_val])); double(subs(df_dy, [x, y], [x_val, y_val]))];   %υπολογισμός του gradient

    x = [];                     %ορίζω το x και y ως πίνακες και θέτω τα πρώτα στοιχεία του ίσα με τις αρχικές τιμές x_0, y_0
    y = []; 
    x=x_0;
    y=y_0;
    a=0.001;                    % ορίζω τις παραμέτρους του κανόνα Armijo
    b=0.2; 
    s=1.1;
    max_k=500;                   %ορίζω μέγιστο αριθμό επαναλήψεων 
    k = 1;                       %και ξεκινάω απο το 1
    
  
    while k < max_k

        grad_val = grad_f(x(k), y(k));         % ορίζω την μεταβλητή grad_val και της θέτω την τιμή του gradient για συγκεκριμένα χ και y

        if norm(grad_val) < e                  % αν το gradient είναι μικρότερο από το e τότε τερματίζει η μέθοδος
            return;
        end

        d = - grad_val;                        % υπολογίζω το  d από τον τύπο του βιβλίου
        
        f_k = f(x(k),y(k));                                            % υπολογίζω το f(x(k)) και το f(x(k+1))
        f_k1 = f(x(k) - s * grad_val(1), y(k) - s * grad_val(2));

        m=0;
        while f_k - f_k1 < -a*b^m*s*d'*grad_val              % με επαναληπτική διαδικασία ψάχνω να βρώ τον μικρότερο μη-αρνητικό ακέραιο για τον οποίο 
            m=m+1;                                           % ισχύει το κριτήριο 4
        end

        g=s*b^m;

        x(k+1) = x(k)-g* grad_val(1);
        y(k+1) = y(k) - g * grad_val(2);

        k = k + 1;
    end
    k=k-1;                      % το k είναι ο αριθμός των επαναλήψεων και το επιστρέφει και η συνάρτηση
end