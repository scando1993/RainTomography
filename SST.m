function att_series = SST(lluvia,f,t,x,theta,tau,v)%n_caso

vs = v/1000; % storm advection velocity [Km/s]
dx = vs*t; % spacing between two consecutives measurements [Km]
n = round(x/dx); % % number of steps for covering the propagation path

%     k = 0.0003490;
%     alpha = 1.5895;
[alpha,k] = fkalfa20C(f,tau,theta);
h = dx*ones(1,n);
c = k.*(lluvia.^alpha);
att_series = conv(c,h);
    
%     switch n_caso
%         case 1
att_series = att_series(1:length(c));
%         case 2
%              y = y( ceil(n/2) : ceil(n/2) + length(c) - 1 );
%         otherwise
%             y = y(n:end);
%     end
end