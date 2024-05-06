function verify=keplers(var)

final = trajectory2(var)

G = 6.6743e-11; % m3kg-1s-2
M = 5.972e24; %kg
Gmin = G/(60^2 * 1000^3); %km3kg-1min-2
mu = Gmin*M; % km3min-2
%mu = 110.719

%fprintf ('%f, %f\n',U(:,1),U(:,2));
%kepler = [U(:,1),U(:,2)];
Nrows = size(final,1); %how many rows
radius = zeros(Nrows,1); %set the array
for ind = 1:Nrows
    radius(ind) = sqrt((final(ind,1)*final(ind,1))+(final(ind,2)*(final(ind,2))));
    %calculate radius for each x,y coord 
end 

final = [final(:,1:2), radius(:,1)]; % add radius to 'final' array
[d,I] = sort(final(:,1:2)); % sort by ascending order of x,y coords
final = final(I,:); %all elements into I
apogee_r = final(1,3); %sorted highest
perigee_r= final(end,3); %sorted lowest
a_real = (apogee_r+perigee_r)/2 ; 
disp (a_real);

T = var(1);              % total time to be simulated
nb = (length(var)-1)/2;  % number of boosts
tb = [var(2:nb+1),T];    % time instances of the boosts  0 < t1 < t2 < ... < T

%Theory
%Give a number to each column of the final() array
%Assign time of orbit to each row
%use when loop to find time where orbit overlaps
%stop loop and record time where orbit overlaps
%time of orbit overlap - time of 2nd boost = period of target orbit
%use as T is equation below

a_test = nthroot(mu*((T-var(2:nb+1)).^2)/(4*(pi^2)),3);
disp (a_test);


end