function [ f ] = basis_function( x, y, rn, sn, delta )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

if isnumeric(x) && isnumeric(y) && isnumeric(rn)...
        && isnumeric(sn) && isnumeric(delta)

    f = roof_function( (x - rn) / delta ) * roof_function( (y - sn) / delta);
else
    error('One of the inputs is not numeric.');
end

end

