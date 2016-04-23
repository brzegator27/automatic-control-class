function object = get_inertial_second_order_with_delay(k, T_1, T_2, theta)

% % % % % % % % % % % % % % %
%           Model B         %
% % % % % % % % % % % % % % %

% inertial second order wit delay
% G(s) = k * e^(-s * theta) / (T_1 * T_2 * s^2 + (T_1 + T_2) * s + 1)
num_iner = k;
den_iner = [T_1 * T_2, T_1 + T_2, 1];
[num_pade, den_pade] = pade(theta, 7);
[num, den] = series(num_pade, den_pade, num_iner, den_iner);

object = tf(num, den);