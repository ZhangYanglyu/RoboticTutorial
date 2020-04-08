% 机械臂的逆向运动学

%   link  |  alpha   a   d   theta
%   —————————————————
%   1     |  0       0   0   Theta1
%   2     |  0       5   0   Theta2
%   3     |  0       2   0   Theta3

% 末端的姿态（x, y, phi）= （3, 5, 45deg） ---> （Theta1, Theta2, Theta3）

% 利用代数的方法求解逆向运动学

% 求解 Theta2 单位：rad
syms x y L1 L2;
c2 = (x^2 + y^2 - L1^2 - L2^2)/(2 * L1 * L2);
% 可行解 1
disp('solution 1：');
s2 = sqrt(1 - c2^2);
Theta2 = atan2(s2, c2);

% 自变量：[L1, L2, x, y]
Theta2Fun = matlabFunction(Theta2);
disp('Theta2 = ');
disp(rad2deg(Theta2Fun(5, 2, 3, 5)));

% 求解 Theta1 单位：rad
k1 = L1 + L2 * c2;
k2 = L2 * s2;
Theta1 = atan2(y, x) - atan2(k2, k1);

% 自变量：[L1, L2, x, y]
Theta1Fun = matlabFunction(Theta1);
disp('Theta1 = ');
disp(rad2deg(Theta1Fun(5, 2, 3, 5)));

% 求解 Theta3 单位：rad
Theta3 = 45 - rad2deg(Theta2Fun(5, 2, 3, 5)) - rad2deg(Theta1Fun(5, 2, 3, 5));
disp('Theta3 = ');
disp(Theta3);

% 可行解 2
disp('solution 2：');
s2 = - sqrt(1 - c2^2);
Theta2 = atan2(s2, c2);

% 自变量：[L1, L2, x, y]
Theta2Fun = matlabFunction(Theta2);
disp('Theta2 = ');
disp(rad2deg(Theta2Fun(5, 2, 3, 5)));

% 求解 Theta1 单位：rad
k1 = L1 + L2 * c2;
k2 = L2 * s2;
Theta1 = atan2(y, x) - atan2(k2, k1);

% 自变量：[L1, L2, x, y]
Theta1Fun = matlabFunction(Theta1);
disp('Theta1 = ');
disp(rad2deg(Theta1Fun(5, 2, 3, 5)));

% 求解 Theta3 单位：rad
Theta3 = 45 - rad2deg(Theta2Fun(5, 2, 3, 5)) - rad2deg(Theta1Fun(5, 2, 3, 5));
disp('Theta3 = ');
disp(Theta3);

