function [ats] = gauss(X,c, r)
%GAUSS Summary of this function goes here
%   Detailed explanation goes here
 ats = exp(-(((X-c)^2)/(2*r^2)));
end

