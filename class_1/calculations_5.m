% we have:
% G_sys_1(s) = (s + 1) / (s^2 + 5s + 1) = 
%               = (s + 1) / ((s + 5/2 + sqrt(21)/2)(s + 5/2 - sqrt(21)/2))
% G_sys_2(s) = 1 / (s^3 + s^2 - 2s + 1)

numerator_1 = [1 1];
denominator_1 = [1 5 1];

numerator_2 = 1;
denominator_2 = [1 1 -2 1];

object_1 = tf(numerator_1, denominator_1);
object_2 = tf(numerator_2, denominator_2);

sys_series = series(object_1, object_2);
sys_parallel = parallel(object_1, object_2);
sys_feedback_minus = feedback(object_1, object_2);
sys_feedback_plus = feedback(object_1, object_2, +1);

sys_series
sys_parallel
sys_feedback_minus
sys_feedback_plus