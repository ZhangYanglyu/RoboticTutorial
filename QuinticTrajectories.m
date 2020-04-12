function [a0, a1, a2, a3, a4, a5] = QuinticTrajectories(pInitial, pFinal, t)
%QUINTICTRAJECTORIES Summary of this function goes here
%   Detailed explanation goes here
a0 = pInitial;
a1 = 0;
a2 = 0;
a3 = 10/(t^3)*(pFinal - pInitial);
a4 = -15/(t^4)*(pFinal - pInitial);
a5 = 6/(t^5)*(pFinal - pInitial);
end

