function [ coeff ] = b_coefficients( i, j, k, Sj )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

if isnumeric(i) && isnumeric(j) && isnumeric(k)

    if j == k && k == i
        coeff = 1;
%     elseif not(any([Sj i] == j)) || not(any([ Sj i ] == k))
%         coeff = 0;
    elseif (i == j && any(Sj(:) == k)) || (k == i && any(Sj(:) == j))
        coeff = -1/8;
    elseif ( any(Sj(:) == j) ) && ( any(Sj(:) == k) )
        coeff = 1/64;
    else
        coeff = 0;
    end
else
    error('One of the inputs is not numeric.');
end

end

