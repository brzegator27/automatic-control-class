% data:
[params, error] = fminsearch('model_B_ident', [1, 1, 1, 1]);

% data:
theta = abs(params(4));
k = params(1);
T_1 = params(2);
T_2 = params(3);

% inertial second order
% G(s) = k * e^ (-s * theta) / (T_1 * T_2 * s^2 + (T_1 + T_2) * s + 1)
num_iner = k;
den_iner = [T_1 * T_2, T_1 + T_2, 1];
[num_pade, den_pade] = pade(abs(theta), 7);
[num, den] = series(num_pade, den_pade, num_iner, den_iner);
object = tf(num, den);

figure();
step(object, 'r');
load('obiekt.mat');
hold on;
plot(y);
