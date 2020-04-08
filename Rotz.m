function R = Rotz(phi)
%ROTZ Summary of this function goes here
%   Detailed explanation goes here
R = [cos(phi) -sin(phi) 0 0;
     sin(phi) cos(phi) 0 0;
     0 0 1 0;
     0 0 0 1];
end

