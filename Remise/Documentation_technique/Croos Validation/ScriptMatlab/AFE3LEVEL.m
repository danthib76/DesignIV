
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Section à décommenter pour un pas inférieure à 50u
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%Courant SPS
figure(1)
subplot(2,1,1)
plot(AFE3LEVEL.time,AFE3LEVEL.signals(2).values)
xlabel('Temps (sec)','FontSize',15)
ylabel('Courant (A)','FontSize',15)
xlim([0.5,0.6])
title('Courant alternatif source SPS','FontSize',15)
grid on

%Courant PSIM
subplot(2,1,2)
plot(Time,Ia,Time, Ib, Time, Ic)
xlabel('Temps (sec)','FontSize',15)
ylabel('Courant (A)','FontSize',15)
xlim([0.5,0.6])
title('Courant alternatif source PSIM','FontSize',15)
grid on

%Tension charge
figure(2)
subplot(1,1,1)
plot(Time,Vch,AFE3LEVEL.time,AFE3LEVEL.signals(3).values(:,1))
xlabel('Temps (sec)','FontSize',15)
ylabel('Tension (V)','FontSize',15)
xlim([0,1])
ylim([4950,5050])
legend('PSIM Tension charge', 'SPS Tension charge')
grid on

%Tension IGBT
figure(3)
subplot(2,1,1)
plot(Time,S8IGBT,AFE3LEVEL.time,IGBT.signals.values(:,2))
xlabel('Temps (sec)','FontSize',15)
ylabel('Tension (V)','FontSize',15)
legend('PSIM Tension IGBT', 'SPS Tension IGBT')
xlim([0.5,0.52])
grid on

%Courant IGBT
subplot(2,1,2)
plot(Time,IS8IGBT1,AFE3LEVEL.time,IGBT.signals.values(:,1))
xlabel('Temps (sec)','FontSize',15)
ylabel('Courant (A)','FontSize',15)
legend('PSIM Courant IGBT', 'SPS Courant IGBT')
xlim([0.5,0.52])
grid on


%Tension Diode
figure(4)
subplot(2,1,1)
plot(Time,S8DIODE*-1,AFE3LEVEL.time,DIODE.signals.values(:,2))
xlabel('Temps (sec)','FontSize',15)
ylabel('Tension (V)','FontSize',15)
legend('PSIM Tension diode', 'SPS Tension diode')
xlim([0.5,0.52])
grid on

%Courant Diode
subplot(2,1,2)
plot(Time,IS8D1,AFE3LEVEL.time,DIODE.signals.values(:,1))
xlabel('Temps (sec)','FontSize',15)
ylabel('Courant (A)','FontSize',15)
legend('PSIM Courant diode', 'SPS Courant diode')
xlim([0.5,0.52])
grid on