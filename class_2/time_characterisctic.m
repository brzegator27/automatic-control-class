% data
k = 3;
T = 8;
T_1 = 5;
T_2 = 3;
T_d = 12;
T_i = 14;

xi = 1.2;
theta = 10;
omega = logspace(-2, 2, 100);

dyn_systems_num_dem = cell(6);

% inertial first order
% G(s) = k / (T * s + 1)
num_and_den = cell(2);
num_and_den{1} = k;
num_and_den{2} = [T, 1];
dyn_systems_num_dem{1} = num_and_den;

% inertial second order
% G(s) = k / (T_1 * T_2 * s^2 + (T_1 + T_2) * s + 1)
num_and_den = cell(2);
num_and_den{1} = k;
num_and_den{2} = [T_1 * T_2, T_1 + T_2, 1];
dyn_systems_num_dem{2} = num_and_den;

% inertial second order with oscillations
% G(s) = k / (T^2 * s^2 + 2 * xi * T * s + 1)
num_and_den = cell(2);
num_and_den{1} = k;
num_and_den{2} = [T^2, 2 * xi * T, 1];
dyn_systems_num_dem{3} = num_and_den;

% integrating ideal
% G(s) = k / T_i * s
num_and_den = cell(2);
num_and_den{1} = k;
num_and_den{2} = [T_i, 0];
dyn_systems_num_dem{4} = num_and_den;

% integrating real
% G(s) = k / T_i * s * (T * s + 1)
num_and_den = cell(2);
num_and_den{1} = k;
num_and_den{2} = [T_i * T, T_i, 0];
dyn_systems_num_dem{5} = num_and_den;

% % differential ideal
% % G(s) = T_d * s
% num_and_den = cell(2);
% num_and_den{1} = [T_d, 0];
% num_and_den{2} = 1;
% dyn_systems_num_dem{6} = num_and_den;

% differential real
% G(s) = (T_d * s) / (T * s + 1)
num_and_den = cell(2);
num_and_den{1} = [T_d, 0];
num_and_den{2} = [T, 1];
dyn_systems_num_dem{6} = num_and_den;

% figure();
for i = 1:length(dyn_systems_num_dem)
    elem = dyn_systems_num_dem{i};
    num = elem{1};
    den = elem{2};
    [y_step, x_step, time_step] = step(num, den);
    [y_impulse, x_impulse, time_impulse] = impulse(num, den);
    figure();
    plot(time_step, y_step, time_impulse, y_impulse);
    
    figure();
    [A, F] = bode(num, den, omega);
    subplot(1, 2, 1);
    plot(A, F);
    
    [Re, Im] = nyquist(num, den);
    subplot(1, 2, 2);
    plot(Re(:), Im(:));
end;


% inertial first order with delay
% G(s) = e^(-s * theta) / (T * s + 1)
num_iner = k;
den_iner = [T, 1];
[num_pade, den_pade] = pade(theta, 5);
[num, den] = series(num_pade, den_pade, num_iner, den_iner);
[y_step, x_step, time_step] = step(num, den);
[y_impulse, x_impulse, time_impulse] = impulse(num, den);

figure();
plot(time_step, y_step, time_impulse, y_impulse);

figure();
[A, F] = bode(num, den, omega);
subplot(1, 2, 1);
plot(A, F);
    
[Re, Im] = nyquist(num, den);
subplot(1, 2, 2);
plot(Re(:), Im(:));





