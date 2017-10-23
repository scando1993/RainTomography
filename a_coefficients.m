function [ a ] = a_coefficients( x0, y0, xf, yf, rn, sn, delta )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

if isnumeric(x0) && isnumeric(y0) && isnumeric(xf)&&...
        isnumeric(yf) && isnumeric(sn) && isnumeric(rn) && isnumeric(delta)
%     syms t;
    x_t = @(x) roof_function( ( (xf - x0) * x + x0 - rn ) / delta );
    y_t = @(x) roof_function( ( (yf - y0) * x + y0 - sn ) / delta );
    c = sqrt( ( xf - x0 )^2 + ( yf - y0 )^2 );
    func = @(x) x_t(x) * y_t(x);
    
    r = integral(func, 0, 1, 'ArrayValued',true);
    
    a = c*r;
else
    
    error('One of the inputs is not numeric.');
    
end

end

