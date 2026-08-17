function [proj] = projection(xi,a, b)
    
    if xi <= a
        proj = a;
    elseif xi >= b
        proj = b;
    else
        proj = xi;
    end
    
end