% 齐次变换矩阵
% 关于 z 轴旋转 90 度
% 然后，关于 y 轴旋转 90 度
% 最后，在 x 的方向平移 4 个单位长度

vector3 = [4;0;0];

H = Trans(vector3)*Roty(deg2rad(90))*Rotz(deg2rad(90));

% 未变换之前的坐标
point1 = [1 0 2 1]';
point2 = [1 0 0 1]';
point3 = [1 4 0 1]';
point4 = [-1 4 0 1]';
point5 = [-1 0 0 1]';
point6 = [-1 0 2 1]';

% 变换之后的坐标
point1New = H*point1;
disp('point1New = ')
disp(point1New);
point2New = H*point2;
disp('point2New = ')
disp(point2New);
point3New = H*point3;
disp('point3New = ')
disp(point3New);
point4New = H*point4;
disp('point4New = ')
disp(point4New);
point5New = H*point5;
disp('point5New = ')
disp(point5New);
point6New = H*point6;
disp('point6New = ')
disp(point6New);