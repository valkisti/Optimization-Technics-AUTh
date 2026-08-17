function result = fibonacci(n)                            % ορίζουμε την ακολουθία fibonacci
    if n <= 0
        result = 0;
    elseif n == 1
        result = 1;
    else
        result = fibonacci(n - 1) + fibonacci(n - 2);
    end
end