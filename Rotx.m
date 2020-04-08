function R = Rotx(psi)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
R = [1 0 0 0;
     0 cos(psi) -sin(psi) 0;
     0 sin(psi) cos(psi) 0;
     0 0 0 1];
end

