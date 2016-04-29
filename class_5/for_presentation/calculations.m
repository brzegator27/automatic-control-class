% data
k = 3;
T = 8;
T_1 = 5;
T_2 = 3;
T_d = 12;
T_i = 14;

xi = 1.2;
theta = 30;
omega = logspace(-2, 2, 100);

dyn_systems_num_dem = cell(6);

% inertial first order
% G(s) = k / (T * s + 1)
num_and_den = cell(3);
num_and_den{1} = k;
num_and_den{2} = [T, 1];
num_and_den{3} = 'inercyjny I rzêdu';
dyn_systems_num_dem{1} = num_and_den;

% inertial second order
% G(s) = k / (T_1 * T_2 * s^2 + (T_1 + T_2) * s + 1)
num_and_den = cell(2);
num_and_den{1} = k;
num_and_den{2} = [T_1 * T_2, T_1 + T_2, 1];
num_and_den{3} = 'inercyjny II rzêdu';
dyn_systems_num_dem{2} = num_and_den;

% inertial second order with oscillations
% G(s) = k / (T^2 * s^2 + 2 * xi * T * s + 1)
num_and_den = cell(2);
num_and_den{1} = k;
num_and_den{2} = [T^2, 2 * xi * T, 1];
num_and_den{3} = 'inercyjny II rzêdu(oscylacyjny)';
dyn_systems_num_dem{3} = num_and_den;

% integrating ideal
% G(s) = k / T_i * s
num_and_den = cell(2);
num_and_den{1} = k;
num_and_den{2} = [T_i, 0];
num_and_den{3} = 'ca³kuj¹cy idealny';
dyn_systems_num_dem{4} = num_and_den;

% integrating real
% G(s) = k / T_i * s * (T * s + 1)
num_and_den = cell(2);
num_and_den{1} = k;
num_and_den{2} = [T_i * T, T_i, 0];
num_and_den{3} = 'ca³kuj¹cy rzeczywisty';
dyn_systems_num_dem{5} = num_and_den;

% differential real
% G(s) = (T_d * s) / (T * s + 1)
num_and_den = cell(2);
num_and_den{1} = [T_d, 0];
num_and_den{2} = [T, 1];
num_and_den{3} = 'ró¿niczkuj¹cy rzeczywisty';
dyn_systems_num_dem{6} = num_and_den;


% for i = 1:length(dyn_systems_num_dem)
%     elem = dyn_systems_num_dem{i};
%     num = elem{1};
%     den = elem{2};
%     whole_plot_title = elem{3};
%     
%     figure();
%     subplot(2, 2, [1, 2]);
%     sys = tf(num, den);
%     pzmap(sys);
%     title('Poles');
% 
%     subplot(2, 2, [3, 4]);
%     step(num, den);
%     title('Step response');
%     
%     set(gca, 'XTickLabelMode', 'manual', 'XTickLabel', [1, 2]);
%     set(gca, 'YTickLabelMode', 'manual', 'YTickLabel', [1, 2]);
%     
%     set(gca, 'XTickLabelMode', 'manual', 'XTickLabel', [3, 4]);
%     set(gca, 'YTickLabelMode', 'manual', 'YTickLabel', [3, 4]);
%     
%     % Create a common title for all the subplots
%     % Source: http://blog.intgckts.com/numbering-subplots-in-matlab/
%     set(gcf, 'NextPlot', 'add');
%     axes; 
%     set(gca, 'Visible', 'off'); 
%     h = title(whole_plot_title, 'fontweight', 'b');
%     set(h, 'Visible', 'on');
% end;


% inertial first order with delay
% G(s) = k * e^(-s * theta) / (T * s + 1)
num_iner = k;
den_iner = [T, 1];

[num_pade, den_pade] = pade(theta, 5);
[num, den] = series(num_pade, den_pade, num_iner, den_iner);

[num_pade_2, den_pade_2] = pade(theta * 2, 5);
[num_2, den_2] = series(num_pade_2, den_pade_2, num_iner, den_iner);

figure();

subplot(2, 2, [1, 2]);
sys = tf(num, den);
pzmap(sys);
hold on
sys_2 = tf(num_2, den_2);
pzmap(sys_2);

title('Poles');

subplot(2, 2, [3, 4]);
step(num, den);
hold on
step(num_2, den_2);
title('Step response');

set(gca, 'XTickLabelMode', 'manual', 'XTickLabel', [1, 2]);
set(gca, 'YTickLabelMode', 'manual', 'YTickLabel', [1, 2]);

set(gca, 'XTickLabelMode', 'manual', 'XTickLabel', [3, 4]);
set(gca, 'YTickLabelMode', 'manual', 'YTickLabel', [3, 4]);

% Create a common title for all the subplots
% Source: http://blog.intgckts.com/numbering-subplots-in-matlab/
set(gcf, 'NextPlot', 'add');
axes; 
set(gca, 'Visible', 'off'); 
h = title('inercyjny I rzêdu z opóŸnieniem', 'fontweight', 'b');
set(h, 'Visible', 'on');



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

elem = dyn_systems_num_dem{2};
num = elem{1};
den = elem{2};
whole_plot_title = elem{3};

elem_2 = dyn_systems_num_dem{3};
num_2 = elem_2{1};
den_2 = elem_2{2};
whole_plot_title_2 = elem_2{3};

figure();
subplot(2, 2, [1, 2]);
sys = tf(num, den);
num
den
pzmap(sys);
hold on
sys_2 = tf(num_2, den_2);
num_2
den_2
pzmap(sys_2);
title('Poles');

subplot(2, 2, [3, 4]);
step(num, den);
hold on
step(num_2, den_2);
title('Step response');

set(gca, 'XTickLabelMode', 'manual', 'XTickLabel', [1, 2]);
set(gca, 'YTickLabelMode', 'manual', 'YTickLabel', [1, 2]);

set(gca, 'XTickLabelMode', 'manual', 'XTickLabel', [3, 4]);
set(gca, 'YTickLabelMode', 'manual', 'YTickLabel', [3, 4]);

% Create a common title for all the subplots
% Source: http://blog.intgckts.com/numbering-subplots-in-matlab/
set(gcf, 'NextPlot', 'add');
axes; 
set(gca, 'Visible', 'off'); 
h = title([whole_plot_title, ' & ', whole_plot_title_2], 'fontweight', 'b');
set(h, 'Visible', 'on');





