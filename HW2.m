% Standard Denavit-Hartenberg Notation
syms theta d a alpha phi psi;

% 第 n 个坐标在第 n-1 个坐标上的表示
A = Rotz(theta) * Trans([0,0,d]) * Trans([a,0,0]) * Rotx(alpha);
disp('A = ');
disp(A);

% Modified Denavit-Hartenberg Notation

% 第 n 个坐标在第 n-1 个坐标上的表示
B = Rotx(alpha) * Trans([a,0,0]) * Rotz(theta) * Trans([0,0,d]);
disp('B = ');
disp(B);

% X-Y-Z fixed angles rotation
EulerXYZ = Rotz(phi) * Roty(theta) * Rotx(psi);
disp('EulerXYZ in X-Y-Z fixed angles rotation = ');
disp(EulerXYZ);

% Z-Y-X  Euler angles rotation
EulerZYX = Rotz(phi) * Roty(theta) * Rotx(psi);
disp('EulerZYX in Z-Y-X  Euler angles rotation = ');
disp(EulerZYX);

% Z-Y-Z Euler angles rotation
EulerZYZ = Rotz(phi) * Roty(theta) * Rotz(psi);
disp('EulerZYZ in Z-Y-X  Euler angles rotation = ');
disp(EulerZYZ);

% 绕 x 旋转 -90，绕 y 旋转 90，绕 z 旋转 -90 using Roll-Pitch-Yaw rotation.
RPY = Rotz(deg2rad(-90)) * Roty(deg2rad(90)) * Rotx(deg2rad(-90));
disp('RPY = ');
disp(RPY);

% 绕 x 旋转 90，绕 y 旋转 90，绕 z 旋转 -90 using Z-Y-X Euler angles rotation
ZYX = Rotz(deg2rad(-90)) * Roty(deg2rad(90)) * Rotx(deg2rad(90));
disp('ZYX = ');
disp(ZYX);
% 绕 z 旋转 90，绕 y 旋转 -90，绕 z 旋转 90 using Z-Y-Z Euler angles rotation
ZYZ = Rotz(deg2rad(90)) * Roty(deg2rad(-90)) * Rotz(deg2rad(90));
disp('ZYZ = ');
disp(ZYZ);

% Consider a three revolute joints (3R) manipulator. It is represented by standard DH notation

% i |   theta |   alpha |  a |    d
% 1 |   theta1|   -90   |  L1|    0
% 2 |   theta2|   0     |  L2|    0
% 3 |   theta3|   0     |  L3|    0

syms theta1 theta2 theta3 L1 L2 L3;

A1_0 = Rotz(theta1) * Trans([0,0,0]) * Trans([L1,0,0]) * Rotx(deg2rad(-90));
A2_1 = Rotz(theta2) * Trans([0,0,0]) * Trans([L2,0,0]) * Rotx(0);
A3_2 = Rotz(theta3) * Trans([0,0,0]) * Trans([L3,0,0]) * Rotx(0);

A3_0 = A1_0 * A2_1 * A3_2;
disp('A3_0 = ');
disp(A3_0);

% Consider a 3R manipulator again. It is represented by modified DH notation.
% i |   theta |   alpha |  a |    d
% 1 |   theta1|   0     |  0 |    0
% 2 |   theta2|   -90   |  L1|    0
% 3 |   theta3|   0     |  L2|    0
% 4 |   0     |   0     |  L3|    0

% Rotx(alpha) * Trans([a,0,0]) * Rotz(theta) * Trans([0,0,d]);
B1_0 = Rotx(0) * Trans([0,0,0]) * Rotz(theta1) * Trans([0,0,0]);
B2_1 = Rotx(deg2rad(-90)) * Trans([L1,0,0]) * Rotz(theta2) * Trans([0,0,0]);
B3_2 = Rotx(0) * Trans([L2,0,0]) * Rotz(theta3) * Trans([0,0,0]);
B4_3 = Rotx(0) * Trans([L3,0,0]) * Rotz(0) * Trans([0,0,0]);

B4_0 = B1_0 * B2_1 * B3_2 * B4_3;
disp('B4_0 = ');
disp(B4_0);