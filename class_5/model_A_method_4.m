% data:
[params, error] = fminsearch('model_A_ident', [1, 1, 1]);

% data:
theta = abs(params(3));
k = params(1);
T = params(2);

% inertial first order with delay
% G(s) = e^(-s * theta) / (T * s + 1)
object = get_inertial_first_order_with_delay(k, T, theta);

figure();
step(object, 'r');
load('obiekt.mat');
hold on;
plot(y);
