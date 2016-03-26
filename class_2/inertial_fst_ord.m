data;

% first order inertial system
% G(s) = k / (T * s  + 1)

numerator = k;
denominator = [T 1];
[num den] = eqtflength(numerator, denominator);

[y_s, x_s, time_s] = step(num, den);
[y_i, x_i, time_i] = impulse(num, den);

plot(time_s, y_s, time_i, y_i);