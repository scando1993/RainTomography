function [ k ] = iterative_algorithm( A, B, p, b0, a0, N, eps, l )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

k0 = 0;
I = eye(N);

    for i = 1:l
        k = k0 + ( 1/gammna_func(A,B,a0,b0) ) *...
            (-(I + b0 * B) * k0 + a0 * A' * ( p - A * k0 ));
        if abs( k - k0 ) > eps
           k0 = k; 
        else
            break
        end
    end
end

