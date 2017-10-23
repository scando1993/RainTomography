function PlotAtt(time,att)

plot(time,att,'-.','linewidth',1.5);
%title('Attenuation series');
xlabel('Time');
ylabel('Attenuation [dB]');
grid on

end