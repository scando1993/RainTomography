function PlotRain(time,rain)

plot(time,rain,'-','linewidth',1.5);
%title('Rain rate time series');
xlabel('Time');
ylabel('Rain Rate [mm/h]');
grid on

end