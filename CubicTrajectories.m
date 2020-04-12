% 运动轨迹
% 利用三次多项式进行规划
% theta(t) = a3 t^3 + a2 t^2 + a1 t + a0;
function [a0, a1, a2, a3] = CubicTrajectories(pInitial, pFinal, t)
a0 = pInitial;
a1 = 0;
a2 = 3/(t^2)*(pFinal - pInitial);
a3 = -2/(t^3)*(pFinal - pInitial);
end