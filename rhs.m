function du=rhs(t,u)

x  = u(1);
y  = u(2);
dx = u(3);
dy = u(4);

%% mu calculations
G = 6.6743e-11; % m3kg-1s-2
M = 5.972e24; %kg
Gmin = G/(60^2 * 1000^3); %km3kg-1min-2
mu = Gmin*M; % km3min-2
%mu = 110.719

r = sqrt(x*x + y*y);

ddx = - mu / r^3 * x;
ddy = - mu / r^3 * y;

du = [dx;dy;ddx;ddy]; %4 

end