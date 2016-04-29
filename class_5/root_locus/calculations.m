% G(s) = 1 / (s + 1) * (5s + 1)
num_1 = 1;
den_1 = conv([1, 1], [5, 1]);

figH = figure();
rlocus(num_1, den_1);
sgrid;
[K_1, poles_1] = rlocfind(num_1, den_1);
close(figH);


% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% G(s) = (0.5s + 1) / (s + 1) * (5s + 1)
num_2 = [0.5, 1];
den_2 = [5, 6, 1];

figH = figure();
rlocus(num_2, den_2);
sgrid;
[K_2, poles_2] = rlocfind(num_2, den_2);
close(figH);


% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% G(s) = 1 / (s + 1) * (5s + 1) * (0.5s + 1)
num_3 = 1;
den_3= [2.5, 8, 6.5, 1];

figH = figure();
rlocus(num_3, den_3);
[K_3, poles_3] = rlocfind(num_3, den_3);

str = sprintf('K_1: %f, K_2: %f, K_3: %f', K_1, K_2, K_3);
disp(str);

