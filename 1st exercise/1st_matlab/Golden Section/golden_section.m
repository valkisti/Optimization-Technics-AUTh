function [a, b, k, l] = golden_section(f, lamda)
    k = 1;
    a = [];
    b = [];
    a(k) = 0;
    b(k) = 3;
    l = lamda;                                    % θέτουμε το τελικό εύρος αναζήτησης
    gama = 0.618;                                  

    x1 = a(k) + (1 - gama) * (b(k) - a(k));
    x2 = a(k) + gama * (b(k) - a(k));

    while b(k) - a(k) > l   
             k=k+1;                                    % Αν b(k) - a(k) < l ο αλγόριθμος τερματίζει. Διαφορετικά:  
        if  subs(f, x1) > subs(f, x2)                            % Βήμα 2
            a(k) = x1;                 
            b(k) = b(k-1);
            x1 = x2;
            x2 = a(k) + gama * (b(k ) - a(k));
            
        else                                     % Βήμα 3
            a(k ) = a(k-1);
            b(k ) = x2;
            x2 = x1;
            x1 = a(k ) + (1 - gama) * (b(k ) - a(k ));
        end
    end
end
