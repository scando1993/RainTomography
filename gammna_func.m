function [ gamma ] = gammna_func( A, B, a0, b0 )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

if ismatrix(A) && ismatrix(B) 
    if isnumeric(a0) && isnumeric(b0)
        [na,ma] = size(A);
        [nb,mb] = size(B);
        I = eye(nb,mb);
        M = I + b0*B + a0*transpose(A)*A;
        e = eig(M);
        e = e(e == real(e));
        gamma = (max(e)+min(e))/2;
    else
        error('One of the inputs a0 or b0 is not a number.');
    end
    
else
    error('One of the inputs A or B is not a matrix.');
end 

end

