
mu = 110.719;
r = 10;
rt = 20;


vel = sqrt (mu*(2/r - 1/rt)); %speed of orbiting body            

dv1 = sqrt(mu/r)*(sqrt((2 * rt)/(r + rt)) - 1); %speed at original orbit

dv2  = sqrt(mu/rt)*(1 - sqrt((2 * r)/(r + rt))); %speed at target orbit

tH = pi * sqrt((r + rt)^3/(8 * mu)); %time for transfer of orbit

w2 = sqrt(mu/rt^3); %target angular velocity

disp (vel);
disp (dv1);
disp (dv2);
disp (tH);
disp (w2);

