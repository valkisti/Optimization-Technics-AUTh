% Funtion to calculate the value of each Gaussian

function val = f_approx(x1_approx, x2_approx, genes, genesNumber)
    val = 0;
    for i = 1:5:genesNumber
        A = genes(i);
        c1 = genes(i+1);
        c2 = genes(i+2);
        s1 = genes(i+3);
        s2 = genes(i+4);
        pwr = ((x1_approx-c1)^2/(2*s1^2)) + ((x2_approx-c2)^2/(2*s2^2));
        val = val + A * exp(-pwr);
    end
end