function [ A ] = a_matrix( rm, N, L )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

A = zeros(length(rm(:,1)),N);
delta = L/sqrt(N);
syms x;

for i = 1:length(rm(:,1))
    cont = 1;
    x0 = rm(i,1);
    xf = rm(i,2);
    y0 = rm(i,3);
    yf = rm(i,4);
    for j = 0:( sqrt(N) - 1 )
        for k = 0: ( sqrt(N) - 1 )
            rn = (j + .5)*delta ;
            sn = (k + .5)*delta ;
            A(i,cont) = a_coefficients(x0, y0, xf, yf, rn, sn, delta);
            cont = cont + 1;
        end
    end
end

end

