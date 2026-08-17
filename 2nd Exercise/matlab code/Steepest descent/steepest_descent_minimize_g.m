function [k, d, x, y] = steepest_descent_minimize_g(f, x_0, y_0,e)
   
    syms x y;

    df_dx = diff(f, x);                                 %υπολογισμός των παραγώγων
    df_dy = diff(f, y);
    grad_f = @(x_val, y_val) [double(subs(df_dx, [x, y], [x_val, y_val])); double(subs(df_dy, [x, y], [x_val, y_val]))];       %υπολογισμός του gradient

    x = [];                      % ορίζω το x και το y και θέτω τα πρώτα στοιχεία τους ίσα με x_0 ,y_0 
    y = [];
    x = x_0;
    y = y_0;
    max_k = 500;                 %ορίζω μέγιστο αριθμό επαναλήψεων 
    k = 1 ;                      %και ξεκινάω απο το 1
    a = 0;  b = 2;               % ορίζω το διάστημα μέσα στο οποίο θα ψάξει τη βέλτιστη λύση η golden section

    while k <= max_k

        grad_val = grad_f(x(k), y(k));            % ορίζω την μεταβλητή grad_val και της θέτω την τιμή του gradient για συγκεκριμένα χ και y

        if norm(grad_val) < e
            break; 
        end
        
        d = - grad_val;                   % υπολογίζω το  d από τον τύπο του βιβλίου
        
        h = @(g) f(x(k) - g*grad_val(1),y(k) - g*grad_val(2));         %ορίζω την συνάρτηση για την οποία θα βρω το βέλτιστό g με την golden section
        g = golden_section(h,0.01,a,b);                                % καλώ την golden section
        
        x(k+1) = x(k) - g * grad_val(1);
        y(k+1) = y(k) - g * grad_val(2);

        k = k + 1;
    end
    k = k-1;                         % το k είναι ο αριθμός των επαναλήψεων και το επιστρέφει και η συνάρτηση
end