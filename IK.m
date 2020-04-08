% 机械臂的逆向运动学

%   link  |  alpha   a   d   theta
%   —————————————————
%   1     |  0       0   0   Theta1
%   2     |  0       5   0   Theta2
%   3     |  0       2   0   Theta3

% 末端的姿态（x, y, phi）= （3, 5, 45deg） ---> （Theta1, Theta2, Theta3）

% 利用几何的方法求解逆向运动学
syms x y L1 L2
c2 = (x^2 + y^2 - L1^2 - L2^2)/(2*L1*L2);

% symvar(c2)
% 自变量：[L1, L2, x, y]
c2Fun = matlabFunction(c2);

% 求出 Theta2 以 rad 为单位
Theta2 = acos(c2Fun(5, 2, 3, 5));
% 将弧度转化为角度
disp('Theta2 =');
disp(rad2deg(Theta2));

cpsi = (L2^2 - (x^2 + y^2) - L1^2)/(-2*L1*sqrt(x^2 + y^2));
% 自变量：[L1, L2, x, y]
cpsiFuc = matlabFunction(cpsi);

% 求出 psi 以 rad 为单位
psi = acos(cpsiFuc(5, 2, 3, 5));
% 将弧度转化为角度
disp('psi =');
disp(rad2deg(psi));

% 确定 Theta1 的一种解法
% 求出 Theta1 以 rad 为单位
Theta1 = atan2(5, 3) - psi;
% 将弧度转化为角度
disp('Theta1 =');
disp(rad2deg(Theta1));

% 求出 Theta3 以 rad 为单位
Theta3 = deg2rad(45) - Theta1 - Theta2;
disp('Theta3 =');
disp(rad2deg(Theta3));