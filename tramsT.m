syms alpha a theta d;

% 沿着 x 轴转动 alpha 角度
T_xAlpha = [1 0 0 0;
            0 cos(alpha) -sin(alpha) 0;
            0 sin(alpha) cos(alpha) 0;
            0 0 0 1];
% 沿着 x 轴移动 a 长度
T_xA = [1 0 0 a;
        0 1 0 0;
        0 0 1 0;
        0 0 0 1];
    
% 沿着 z 轴转动 theta 角度
T_zTheta = [cos(theta) -sin(theta) 0 0;
            sin(theta) cos(theta) 0 0;
            0 0 1 0;
            0 0 0 1];
        
% 沿着 z 轴移动 d 长度
T_zD = [1 0 0 0;
        0 1 0 0;
        0 0 1 d;
        0 0 0 1];
    
% 两坐标间的坐标变换
T = T_xAlpha * T_xA * T_zTheta * T_zD;
% disp('T = ');
% disp(T);

% 返回符号函数的自变量
symvar(T);
fuc = matlabFunction(T);

%   link  |  alpha   a   d   theta
%   —————————————————
%   1     |  0       0   0   Theta1
%   2     |  0      L1   0   Theta2
%   3     |  0      L2   0   Theta3

syms L1 L2 Theta1 Theta2 Theta3

T3_2 = fuc(L2, 0, 0, Theta3);
T2_1 = fuc(L1, 0, 0, Theta2);
T1_0 = fuc(0, 0, 0, Theta1);
T3_0 = T1_0 * T2_1 * T3_2;

% 机械臂的顺向运动学
disp(T3_0);