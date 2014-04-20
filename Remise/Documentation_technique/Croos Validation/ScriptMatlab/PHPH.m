%tension ligne ligne
figure(1)
subplot(2,1,1)
plot(PHPH.time,PHPH.signals.values)
xlabel('Temps (sec)','FontSize',15)
ylabel('Tension (V)','FontSize',15)
title('Tension ligne-ligne SPS','FontSize',15)
grid on

subplot(2,1,2)
plot(Time,PHPH1)
xlabel('Temps (sec)','FontSize',15)
ylabel('Tension (V)','FontSize',15)
title('Tension ligne-ligne PSIM','FontSize',15)
xlim([0,0.9])
grid on

%Tension IGBT
figure(2)
subplot(2,1,1)
plot(Time,S3Vigbt,PHPH.time,IGBTA.signals.values(:,2))
xlabel('Temps (sec)','FontSize',15)
ylabel('Tension (V)','FontSize',15)
legend('PSIM Tension IGBT', 'SPS Tension IGBT')
xlim([0,0.9])
grid on


subplot(2,1,2)
plot(Time,S3Vigbt,PHPH.time,IGBTA.signals.values(:,2))
xlabel('Temps (sec)','FontSize',15)
ylabel('Tension (V)','FontSize',15)
xlim([0.5,0.52])
grid on

%Courant IGBT
figure(3)
subplot(2,1,1)
plot(Time,IS3IGBT1,PHPH.time,IGBTA.signals.values(:,1))
xlabel('Temps (sec)','FontSize',15)
ylabel('Courant (A)','FontSize',15)
legend('PSIM Courant IGBT', 'SPS Courant IGBT')
xlim([0,0.9])
grid on


subplot(2,1,2)
plot(Time,IS3IGBT1,PHPH.time,IGBTA.signals.values(:,1))
xlabel('Temps (sec)','FontSize',15)
ylabel('Courant (A)','FontSize',15)
xlim([0.5,0.52])
grid on

%Tension DIODE
figure(4)
subplot(2,1,1)
plot(Time,S3Vdiode*-1,PHPH.time,DIODEA.signals.values(:,2))
xlabel('Temps (sec)','FontSize',15)
ylabel('Tension (V)','FontSize',15)
legend('PSIM Tension diode', 'SPS Tension diode')
xlim([0,0.9])
grid on


subplot(2,1,2)
plot(Time,S3Vdiode*-1,PHPH.time,DIODEA.signals.values(:,2))
xlabel('Temps (sec)','FontSize',15)
ylabel('Tension (V)','FontSize',15)
xlim([0.5,0.52])
grid on

%Courant DIODE
figure(5)
subplot(2,1,1)
plot(Time,IS3D1,PHPH.time,DIODEA.signals.values(:,1))
xlabel('Temps (sec)','FontSize',15)
ylabel('Courant (A)','FontSize',15)
legend('PSIM Courant diode', 'SPS Courant diode')
xlim([0,0.9])
grid on

%Courant DIODE
subplot(2,1,2)
plot(Time,IS3D1,PHPH.time,DIODEA.signals.values(:,1))
xlabel('Temps (sec)','FontSize',15)
ylabel('Courant (A)','FontSize',15)
xlim([0.5,0.52])
grid on

%Courant IGBT
figure(6)
subplot(2,1,1)
plot(Time,DCPIgbtI,PHPH.time,IGBTH.signals.values(:,1) )
legend('PSIM courant IGBT','SPS courant IGBT')
xlim([0,0.9])
xlabel('Temps (sec)','FontSize',15)
ylabel('Courant (A)','FontSize',15)
grid on

%Courant IGBT
subplot(2,1,2)
plot(Time,DCPIgbtI,PHPH.time,IGBTH.signals.values(:,1) )
xlim([0.513,0.523]);
xlabel('Temps (sec)','FontSize',15)
ylabel('Courant (A)','FontSize',15)
grid on


%Tension IGBT
figure(7)
subplot(2,1,1)
plot(Time,DCPVigbt,PHPH.time,IGBTH.signals.values(:,2) )
legend('PSIM tension IGBT','SPS tension IGBT')
xlim([0,0.9])
xlabel('Temps (sec)','FontSize',15)
ylabel('Tension (V)','FontSize',15)
grid on

%Tension IGBT
subplot(2,1,2)
plot(Time,DCPVigbt,PHPH.time,IGBTH.signals.values(:,2) )
xlim([0.513,0.523]);
xlabel('Temps (sec)','FontSize',15)
ylabel('Tension (V)','FontSize',15)
grid on

%Courant DIODE
figure(8)
subplot(2,1,1)
plot(Time,IDCPD1,PHPH.time,DIODEH.signals.values(:,1) )
legend('PSIM courant Diode','SPS courant Diode')
xlim([0,0.9])
ylim([-1000,7000])
xlabel('Temps (sec)','FontSize',15)
ylabel('Courant (A)','FontSize',15)
grid on

%Courant DIODE
subplot(2,1,2)
plot(Time,IDCPD1,PHPH.time,DIODEH.signals.values(:,1) )
xlim([0.513,0.523]);
xlabel('Temps (sec)','FontSize',15)
ylabel('Courant (A)','FontSize',15)
grid on

%Tension DIODE
figure(9)
subplot(2,1,1)
plot(Time,DCPVdiode*-1,PHPH.time,DIODEH.signals.values(:,2) )
legend('PSIM tension Diode','SPS tension Diode')
xlim([0,0.9])
xlabel('Temps (sec)','FontSize',15)
ylabel('Tension (V)','FontSize',15)
grid on

%Tension DIODE
subplot(2,1,2)
plot(Time,DCPVdiode*-1,PHPH.time,DIODEH.signals.values(:,2) )
xlim([0.513,0.523]);
xlabel('Temps (sec)','FontSize',15)
ylabel('Tension (V)','FontSize',15)
grid on
