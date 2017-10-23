tic;
delimiterIn = ',';
C = 0.1; % bucket capacity [mm]
f = 24; % link frecuency [GHz]
x1 = 2.2; % ESPOL coverture [Km]
x2 = 1.8; % Mapasingue coverture [Km]
x3 = 3.4; % Kennedy coverture [Km]
x4 = 8.8; % Durán coverture [Km]
theta = 0; % elevation angle [degrees]
tau = 90; % polarization angle [degrees]
v = 7.8; % Storm advection velocity [m/s]
t = 1; % time interval between samples [s]

fecha_inicio = '2017-04-19 00:00:00';
fecha_fin = '2017-04-19 23:59:59';

t_period = datetime(datetime(fecha_inicio):seconds(0.1):datetime(fecha_fin));
imp1 = importdata('ESPOL_19_04_17.txt',delimiterIn);
imp2 = importdata('MAPASING_19_04_17.txt',delimiterIn);
imp3 = importdata('TELCONET_19_04_17.txt',delimiterIn);
imp4 = importdata('DURAN_19_04_17.txt',delimiterIn);

% One second rain rate time series generation
[TRR1,events1] = RainAcumOrig(imp1,C,t_period);
[TRR2,events2] = RainAcumOrig(imp2,C,t_period);
[TRR3,events3] = RainAcumOrig(imp3,C,t_period);
[TRR4,events4] = RainAcumOrig(imp4,C,t_period);
% 
% figure(1);
% subplot(2,2,1);
% PlotRain(TRR1.Time,TRR1.Ra);
% title('Rain-rate time-series ESPOL');
% subplot(2,2,2);
% PlotRain(TRR2.Time,TRR2.Ra);
% title('Rain-rate time-series Mapasingue');
% subplot(2,2,3);
% PlotRain(TRR3.Time,TRR3.Ra);
% title('Rain-rate time-series Kennedy');
% subplot(2,2,4);
% PlotRain(TRR4.Time,TRR4.Ra);
% title('Rain-rate time-series Durán');

% One second attenuation time series generation
TA1 = SST(TRR1.Ra,f,t,x1,theta,tau,v);
TA2 = SST(TRR2.Ra,f,t,x2,theta,tau,v);
TA3 = SST(TRR1.Ra,f,t,x3,theta,tau,v);
TA4 = SST(TRR2.Ra,f,t,x4,theta,tau,v);


Att1 = TA1+TA2;
Att2 = TA2+TA3;
Att3 = TA3+TA4;

figure(2);
subplot(2,2,1);
PlotAtt(TRR1.Time,Att1);
title('Attenuation link 1 (ESPOL-Mapasingue)');
subplot(2,2,2);
PlotAtt(TRR1.Time,Att2);
title('Attenuation link 2 (Mapasingue-Kennedy)');
subplot(2,2,3);
PlotAtt(TRR1.Time,Att3);
title('Attenuation link 3 (Kennedy-Durán)');
toc;

