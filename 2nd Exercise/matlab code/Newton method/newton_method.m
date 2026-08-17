function [k,x, y] = newton_method(f, x_0, y_0,e, g)
    syms x y;

    df_dx = diff(f, x);                                   %υπολογισμός των παραγώγων
    df_dy = diff(f, y);
    hessian = [diff(df_dx, x), diff(df_dx, y); diff(df_dy, x), diff(df_dy, y)];                  %υπολογίζει τον γενικό τύπο του εσσιανού πίνακα
    grad_f = @(x_val, y_val) [double(subs(df_dx, [x, y], [x_val, y_val])); double(subs(df_dy, [x, y], [x_val, y_val]))];      %υπολογισμός του gradient
    hessian_f = @(x_val, y_val)[double(subs(hessian, [x, y], [x_val, y_val]))];              %υπολογίσμος εσσιανού πίνακα με συγκεκριμένες τιμές για το x και y
    
    disp('Hessian matrix:');
    disp(hessian);

    x = [];               %ορίζω το x και y ως πίνακες και θέτω τα πρώτα στοιχεία του ίσα με τις αρχικές τιμές x_0, y_0
    y = [];
    x = x_0;
    y = y_0;
    max_k = 500;         %ορίζω μέγιστο αριθμό επαναλήψεων 
    k = 1 ;              %και ξεκινάω απο το 1

    while k <= max_k


      grad_val = grad_f(x(k), y(k));               % ορίζω την μεταβλητή grad_val και της θέτω την τιμή του gradient για συγκεκριμένα χ και y
      hessian_val = hessian_f(x(k), y(k));         % όμοια για τον εσσιανό 

        disp('Hessian matrix:');                   % τυπώνετε ο εσσιανός και το μέγεθος του
        disp(hessian_val);
        disp('Size of Hessian matrix:');
        disp(size(hessian_val));
       
      if any(eig(hessian_val) <= 0)                % αν ο εσσιανός δεν είναι θετικά ορισμένος τότε δεν μπορούμε να εφαρμόσουμε την μέθοδο
            disp('Hessian is not positive definite. Newton method cannot proceed.');
            break;
      end

        if norm(grad_val) < e                      % αν το gradient είναι μικρότερο από το e τότε τερματίζει η μέθοδος
            break; 
        end

        d = -inv(hessian_val) .* grad_val';        % υπολογίζω το  d από τον τύπο του βιβλίου 
        x(k+1) = x(k) + g * d(1);              
        y(k+1) = y(k) + g * d(2);

        k = k + 1;
    end
        k = k-1;                     % το k είναι ο αριθμός των επαναλήψεων και το επιστρέφει και η συνάρτηση
end