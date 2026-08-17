function [value] = golden_section(f, lamda, alpha, beta)
    
k = 1;
    a= alpha;
    b = beta;
    l = lamda;                                    % θέτουμε το τελικό εύρος αναζήτησης
    gama = 0.618;                                 

    x1 = a + (1 - gama) * (b - a);
    x2 = a + gama * (b - a);

    while b - a > l   
             k=k+1;                                           % Αν b(k) - a(k) < l ο αλγόριθμος τερματίζει. Διαφορετικά:  
        if  f(x1) > f(x2)                           % Βήμα 2
            a = x1;                 
            b = b;
            x1 = x2;
            x2 = a + gama * (b - a);
            
        else                                     % Βήμα 3
            a= a;
            b = x2;
            x2 = x1;
            x1 = a + (1 - gama) * (b - a);
        end
    end
    value = (a+b)/2;
end
