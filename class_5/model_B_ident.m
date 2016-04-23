function error = model_B_ident(X0)

k = X0(1);
T_1 = X0(2);
T_2 = X0(3);
theta = X0(4);

% inertial second order
% G(s) = k * e^(-s * theta) / (T_1 * T_2 * s^2 + (T_1 + T_2) * s + 1)
object = get_inertial_second_order_with_delay(k, T_1, T_2, theta);

load('obiekt.mat');
y_real = y;

y_sym = step(object, 1:1:60);   

e = y_real - y_sym;
error = sum(e.^2) / length(e); 