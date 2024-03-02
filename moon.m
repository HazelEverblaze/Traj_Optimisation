% Universal Grav

G = 6.6743e-11; % m3kg-1s-2
M = 5.972e24; %kg
m = 7.342e22; %kg
Gmin = G/(60^2 * 1000^3); %km3kg-1min-2c
mu = Gmin*M; % km3min-2
%mu = 110.719
mumoon = Gmin*m; % km3min-2
%mumoon = 1.3612
perimoon = 363300; %km (from Earth)
apomoon = 405500; %km (from Earth)


