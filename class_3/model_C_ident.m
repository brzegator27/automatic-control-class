function error = model_C_ident(X0)

k = X0(1);
T = X0(2);
n = round(X0(3));

% multi-inertial without delay
% G(s) = k / (T * s  + 1) ^ n
object = get_multiinertial_without_delay(k, T, n);

load('obiekt.mat');
y_real = y;

y_sym = step(object, 1:1:60);   

e = y_real - y_sym;
error = sum(e.^2) / length(e); 