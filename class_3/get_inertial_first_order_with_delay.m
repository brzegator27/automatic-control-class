function object = get_inertial_first_order_with_delay(k, T, theta)

% % % % % % % % % % % % % % %
%           Model A         %
% % % % % % % % % % % % % % %

% inertial first order with delay
% G(s) = e^(-s * theta) / (T * s + 1)
num_iner = k;
den_iner = [T, 1];
[num_pade, den_pade] = pade(theta, 7);
[num, den] = series(num_pade, den_pade, num_iner, den_iner);

object = tf(num, den);