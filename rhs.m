function du=rhs(t,u)

x  = u(1);
y  = u(2);
dx = u(3);
dy = u(4);

two_fixed_planets;

r1 = sqrt((x-x1)*(x-x1)+(y-y1)*(y-y1));
r2 = sqrt((x-x2)*(x-x2)+(y-y2)*(y-y2));

ddx = - mu1 / r1^3 * (x-x1) - mu2 / r2^3 * (x-x2);
ddy = - mu1 / r1^3 * (y-y1) - mu2 / r2^3 * (y-y2);

du = [dx;dy;ddx;ddy];

end