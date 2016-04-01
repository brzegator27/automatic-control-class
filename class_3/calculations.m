% data:
theta = 8;
k = 2.1;
T = 15;

% inertial first order with delay
% G(s) = e^(-s * theta) / (T * s + 1)
num_iner = k;
den_iner = [T, 1];
[num_pade, den_pade] = pade(theta, 7);
[num, den] = series(num_pade, den_pade, num_iner, den_iner);
object = tf(num, den);

figure();
step(object, 'r');
load('obiekt.mat');
hold on;
plot(y);
