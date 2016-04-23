% data:
[params, error] = fminsearch('model_C_ident', [1, 1, 0]);

% data:
k = params(1);
T = params(2);
n = params(3);

% multi-inertial without delay
% G(s) = k / (T * s  + 1) ^ n
object = get_multiinertial_without_delay(k, T, theta);

figure();
step(object, 'r');
load('obiekt.mat');
hold on;
plot(y);
