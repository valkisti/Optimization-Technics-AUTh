function [k,d, x, y] = lavenberg_method(f, x_0, y_0,e, g)
    syms x y;
    
    df_dx = diff(f, x);                                    %υπολογισμός των παραγώγων
    df_dy = diff(f, y);
    hessian = [diff(df_dx, x), diff(df_dx, y); diff(df_dy, x), diff(df_dy, y)];                     %υπολογίσμος του γενικό τύπο του εσσιανού πίνακα
    grad_f = @(x_val, y_val) [double(subs(df_dx, [x, y], [x_val, y_val])); double(subs(df_dy, [x, y], [x_val, y_val]))];     %υπολογισμός του gradient
    hessian_f = @(x_val, y_val)[double(subs(hessian, [x, y], [x_val, y_val]))];            %υπολογίσμος εσσιανού πίνακα με συγκεκριμένες τιμές για το x και y
   
    disp('Hessian matrix:');
    disp(hessian);

    x = [];                            % ορίζω το x και το y και θέτω τα πρώτα στοιχεία τους ίσα με x_0 ,y_0 
    y = [];
    x = x_0;
    y = y_0;
    max_k = 500;                       %ορίζω μέγιστο αριθμό επαναλήψεων
    k = 1 ;
    m_k = 0; 
    
    while k <= max_k

      grad_val = grad_f(x(k), y(k));        % ορίζω την μεταβλητή grad_val και της θέτω την τιμή του gradient για συγκεκριμένα χ και y
      hessian_val = hessian_f(x(k), y(k));   % ορίζω την μεταβλητή hessian_val και της θέτω την τιμή του gradient για συγκεκριμένα χ και y

        if norm(grad_val) < e                % αν το gradient είναι μικρότερο του e τότε τερματίζει ο αλγόριθμος
            break; 
        end
        
        hessian_lm = hessian_val + m_k * eye(2);

        if   (sum(eig(hessian_lm) < 0) > 0)                               %υπολογίζω το m_k ε΄τσι ώστε ο hessian_lm να είναι θετικά ορισμένος δηλαδή οι ιδιοτιμές του να είναι θετικές
                   m_k = max(abs(eig(hessian_lm))) + 0.5;                 % και σε κάθε επανάληψη το αυξάνω με βήμα 0.5
                   hessian_lm = hessian_val + m_k * eye(2);
        end

       d = -hessian_lm \ grad_val;

        x(k+1) = x(k) + g * d(1);
        y(k+1) = y(k) + g * d(2);

        k = k + 1;
    end
    k = k-1;                                % το k είναι ο αριθμός των επαναλήψεων και το επιστρέφει και η συνάρτηση
end