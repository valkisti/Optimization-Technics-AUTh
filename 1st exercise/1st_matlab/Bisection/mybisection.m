function [a,b,k,e,l] = mybisection(f,lamda,epsilon)

    k=1; 
    a=[];
    b=[];
    a(k)=0; b(k)=3;
    e = epsilon;
    l = lamda;

    while b(k)-a(k) > l                         % Αν b(k) - a(k) < l ο αλγόριθμος τερματίζει. Διαφορετικά: 
        x1 = (a(k) + b(k))/2 - epsilon;
        x2 = (a(k) + b(k))/2 + epsilon;
       
        if subs(f, x1) < subs(f, x2)            % Αν f(x1) < f(x2) ορίζω τα παρακάτω:
            a(k+1) = a(k);
            b(k+1) = x2;
        else                                    % Αλλιώς ορίζω:
             a(k+1) = x1;
             b(k+1) = b(k);
        end

        k = k+1;                                % Θέτουμε k = k + 1; πριν επιστρέψουμε στο Βήμα 1
    end
    k = k-1;                                    % Κάνουμε k = k-1; γιατί στην τελευταία επανάληψη το αυξήσαμε ενώ δεν ίσχυε έπειτα η συνθήκη b(k) - a(k) > l
end