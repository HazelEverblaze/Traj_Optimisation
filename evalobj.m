function obj = evalobj(var)

T = var(1);              % total time to be simulated
nb = (length(var)-1)/2;  % number of boosts
tb = [var(2:nb+1),T];    % time instances of the boosts  0 < t1 < t2 < ... < T
mb = var(nb+2:end);      % magnitude of the boosts

final = trajectory(var);

p = [final(1:2),0]; %semi latus rectum
v = [final(3:4),0]; %speed of satellite

% orbit at higher altitude

rt = 20; %km %% target orbit radius (LEO max)
G = 6.6743e-11; % m3kg-1s-2
m = 5.972e24; %kg
Gmin = G/(60^2 * 1000^3); %km3kg-1min-2
mu = Gmin*m; % km3min-2
%mu = 110.719

r = sqrt(p*p'); %equal radius 
ecc = (v*v'/mu - 1/r) * p - p*v'/mu * v; % eccentricity check
% ------------------------------------------

obj = [norm(ecc)+abs((r-rt)/rt)+1,sum(mb.^2)];
%magnitude ecc = 0, fuel calculated based on last boost 

end