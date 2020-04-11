% the two-link planar manipulator

% Step1: DH parameters table "Standed"
% i     theta   alpha   a   d   cos(alpha)  sin(alpha)
% 1     theta1  0       L1  0   1           0
% 2     theta2  0       L2  0   1           0

% Step2: transformation matrices
syms theta1 theta2 L1 L2;

% transformation matrix that relates frame 1 from frame O
A0_1 = Rotz(theta1) * Trans([0,0,0]) * Trans([L1,0,0]) * Rotx(0);

% transformation matrix that relates frame 2 from frame 1
A1_2 = Rotz(theta2) * Trans([0,0,0]) * Trans([L2,0,0]) * Rotx(0);

% transformation matrix that relates frame 2 from frame 0
T0_2 = A0_1 * A1_2;
disp(T0_2);

% 利用代数的方法求解机械臂的逆向运动学
px = T0_2(1, end);
py = T0_2(2, end);
pz = T0_2(3, end);

c2 = (px^2 + py^2 - L2^2 - L1^2)/(2 * L1 * L2);

% 第二个关节的角度
% 其中一个解
s2p = sqrt(1 - c2^2);

Tta2p = atan2(s2p, c2);

% 另一个解
s2n = - sqrt(1 - c2^2);

Tta2n = atan2(s2n, c2);

disp('关节 2 的角度：');
disp('first solution：');
disp(Tta2p);
disp('second solution：');
disp(Tta2n);

% 第一个关节的角度
% 其中一个解
s1p = (py * (L2*c2 + L1) - px * L2 * s2p)/(px^2 + py^2);
c1p = (px * (L2*c2 + L1) + py * L2 * s2p)/(px^2 + py^2);

Tta1p = atan2(s1p, c1p);

% 另一个解
s1n = (py * (L2*c2 + L1) - px * L2 * s2n)/(px^2 + py^2);
c1n = (px * (L2*c2 + L1) + py * L2 * s2n)/(px^2 + py^2);

Tta1n = atan2(s1n, c1n);

disp('关节 1 的角度：');
disp('first solution：');
disp(Tta1p);
disp('second solution：');
disp(Tta1n);
