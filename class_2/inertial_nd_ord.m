data;

% second order inertial system
% G(s) = k / (T_1 * T_2 * s^2  + (T_1 + T_2) * s + 1)

numerator = k;
denominator = [T_1 * T_2 T_1 + T_2 1];
[num den] = eqtflength(numerator, denominator);

[y_s, x_s, time_s] = step(num, den);
[y_i, x_i, time_i] = impulse(num, den);

figure(gig_inertial_nd_ord);
plot(time_s, y_s, time_i, y_i);