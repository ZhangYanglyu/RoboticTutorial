% theta0：初始角度
% thetaf：末端角度
% period：时间
theta0 = 0;
thetaf = 10;
period = 2;
[a0, a1, a2, a3] = CubicTrajectories(theta0, thetaf, period);

time = 1:0.01:2;
theta = a3 * time.^3 + a2 * time.^2 + a1 * time + a0;
plot(time, theta);
