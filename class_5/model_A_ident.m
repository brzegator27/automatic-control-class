function error = model_A_ident(X0)

k = X0(1);
T = X0(2);
theta = X0(3);

% inertial first order with delay
% G(s) = k * e^(-s * theta) / (T * s + 1)
object = get_inertial_first_order_with_delay(k, T, abs(theta));

load('obiekt.mat');
y_real = y;

y_sym = step(object, 1:1:60);   

e = y_real - y_sym;
error = sum(e.^2) / length(e); 