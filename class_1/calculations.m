% read in constants from data.m
data;

% transmittance:
% we've got
% G(s) = 1 / (M * s^2 + alfa * s + c), so
numerator = [0 0 1];
denominator = [M damperConst springConst];
