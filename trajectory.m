function final=trajectory(var)
%% function for orbit loop
T = var(1);              % total time to be simulated
nb = (length(var)-1)/2;  % number of boosts
tb = [var(2:nb+1),T]    % time instances of the boosts  0 < t1 < t2 < ... < T
mb = var(nb+2:end)      % magnitude of the boosts

%% initial state of the orbit
two_fixed_planets;

x = 0; % km  %(LEO min)
y = 1;
dx = sqrt(mu1/y);
dy = 0;%sqrt(mu1/x); % kmmin-1

%% empty matrix to loop into
U = [];
t = [];
b = [];
init = [x;y;dx;dy]; %initial conditions
tspan = [0;tb(1)]; %time 0 to tb1

options = odeset('RelTol',1e-6,'AbsTol',1.e-6); %relative tolerance, absolute tolerance

%% loop over {ode45,boost}
for i=1:nb
    
    [dt,dU] = ode45(@(t,u) rhs(t,u), tspan, init, options);
    %integrates init by tspan using rhs values & equations with tolerances
    %from options
    
    init = dU(end,:); %last calculated r
    
    tspan = [tb(i);tb(i+1)]; 

    b = [b;init(1:2)];
    
    % added boost
    v=init(3:4);
    init(3:4)=v+v/norm(v)*mb(i);
    
    %t = [t;dt];
    U = [U;dU];
    
end

%% final ode45

[dt,dU] = ode45(@(t,u) rhs(t,u), tspan, init, options); %same

%t = [t;dt]
U = [U;dU]

%plot(x,y,'o');
%hold on;
%plot(U(:,1),U(:,2),'-b',b(:,1),b(:,2),'or');
%axis equal;

%plot(t,U(:,2));

final = U(end,:);

end

