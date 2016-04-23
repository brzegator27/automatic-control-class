% data:
theta = 8;
k = 2.1;
T = 15;

% inertial first order with delay
% G(s) = e^(-s * theta) / (T * s + 1)
object = get_inertial_first_order_with_delay(k, T, theta);

figure();
step(object, 'r');
load('obiekt.mat');
hold on;
plot(y);
