function [ y ] = roof_function( u )
%This is a function that has been used as roof defined in Herman and Lent
%1976.
%   U parameter must be a numeric type if it's not it will raise an
%   exception

    if u <= 0 && u >= -1
        y = u + 1;
    elseif u > 0 && u <= 1
        y = 1 - u;
    else
        y = 0;
    end
    return 
end

