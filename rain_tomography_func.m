function [ ri ] = rain_tomography_func( x, y, N, L, k )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

delta = L / sqrt(N);

cont = 1;
temp = 0;

for a = 0:sqrt(N)-1
    for b = 0: sqrt(N)-1
        rn = ( a + .5 ) * delta;
        sn = ( b + .5 ) * delta;
        bn = basis_function(x, y, rn, sn, delta);
        temp = temp + k(cont) * bn;
        cont = cont + 1;
    end
end
    
ri = temp;

end

