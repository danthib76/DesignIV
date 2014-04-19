
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Section à décommenter pour un pas inférieure à 50u
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%Courant SPS
figure(1)
subplot(2,1,1)
plot(hach4quadrants.time,hach4quadrants.signals(2).values)
xlabel('Temps (sec)','FontSize',15)
ylabel('Courant (A)','FontSize',15)
xlim([0.5,0.6])
title('Courant alternatif source SPS','FontSize',15)
grid on

%Courant PSIM
subplot(2,1,2)
plot(Time,V62,Time, V63, Time, V64)
xlabel('Temps (sec)','FontSize',15)
ylabel('Courant (A)','FontSize',15)
xlim([0.5,0.6])
title('Courant alternatif source PSIM','FontSize',15)
grid on

%Tension charge
figure(2)
subplot(1,1,1)
plot(Time,Vch,hach4quadrants.time,hach4quadrants.signals(3).values(:,1))
xlabel('Temps (sec)','FontSize',15)
ylabel('Tension (V)','FontSize',15)
xlim([0,1])
legend('PSIM Tension charge', 'SPS Tension charge')
grid on

%Tension IGBT
figure(3)
subplot(2,1,1)
plot(Time,S1Vigbt,hach4quadrants.time,IGBTA.signals.values(:,2))
xlabel('Temps (sec)','FontSize',15)
ylabel('Tension (V)','FontSize',15)
legend('PSIM Tension IGBT', 'SPS Tension IGBT')
xlim([0.5,0.52])
grid on

%Courant IGBT
subplot(2,1,2)
plot(Time,IS1IGBT,hach4quadrants.time,IGBTA.signals.values(:,1))
xlabel('Temps (sec)','FontSize',15)
ylabel('Courant (A)','FontSize',15)
legend('PSIM Courant IGBT', 'SPS Courant IGBT')
xlim([0.5,0.52])
grid on

%Courant à la charge
figure(4)
subplot(4,1,1)
plot(Time,IMagnet,hach4quadrants.time,hash.signals(1).values(:,2) ,Time,IRef)
legend('PSIM','SPS','REF')
xlim([0,0.9]);
ylim([-1000,7000])
xlabel('Temps (sec)','FontSize',15)
ylabel('Courant (A)','FontSize',15)
grid on

%Courant à la charge
subplot(4,1,2)
plot(Time,IMagnet,hach4quadrants.time,hash.signals(1).values(:,2),Time,IRef)
xlim([0.495,0.505]);
ylim([5920,6080]);
xlabel('Temps (sec)','FontSize',15)
ylabel('Courant (A)','FontSize',15)
grid on

%Courant à la charge
subplot(4,1,3)
plot(Time,IMagnet,hach4quadrants.time,hash.signals(1).values(:,2),Time,IRef)
xlim([0.455,0.465]);
ylim([5400,5700]);
xlabel('Temps (sec)','FontSize',15)
ylabel('Courant (A)','FontSize',15)
grid on

%Courant à la charge
subplot(4,1,4)
plot(Time,IMagnet,hach4quadrants.time,hash.signals(1).values(:,2),Time,IRef)
xlim([0.122,0.132]);
ylim([800,1300]);
xlabel('Temps (sec)','FontSize',15)
ylabel('Courant (A)','FontSize',15)
grid on

%Tension à la charge
figure(5)
subplot(2,1,1)
plot(Time,VMagnet,hach4quadrants.time,hash.signals(2).values(:,1) )
legend('PSIM','SPS')
xlim([0,0.9])
xlabel('Temps (sec)','FontSize',15)
ylabel('Tension (V)','FontSize',15)
grid on

%Tension à la charge
subplot(2,1,2)
plot(Time,VMagnet,hach4quadrants.time,hash.signals(2).values(:,1) )
xlim([0.455,0.465]);
ylim([-5500,5500])
xlabel('Temps (sec)','FontSize',15)
ylabel('Tension (V)','FontSize',15)
grid on

%Courant IGBT
figure(6)
subplot(2,1,1)
plot(Time,DCNIigbt,hach4quadrants.time,IGBTH.signals.values(:,1) )
legend('PSIM','SPS')
xlim([0,0.9])
ylim([-1000,7000])
xlabel('Temps (sec)','FontSize',15)
ylabel('Courant (A)','FontSize',15)
grid on

%Courant IGBT
subplot(2,1,2)
plot(Time,DCNIigbt,hach4quadrants.time,IGBTH.signals.values(:,1) )
xlim([0.513,0.523]);
xlabel('Temps (sec)','FontSize',15)
ylabel('Courant (A)','FontSize',15)


%Tension IGBT
figure(7)
subplot(2,1,1)
plot(Time,DCNVigbt,hach4quadrants.time,IGBTH.signals.values(:,2) )
legend('PSIM','SPS')
xlim([0,0.9])
ylim([-1000,7000])
xlabel('Temps (sec)','FontSize',15)
ylabel('Tension (V)','FontSize',15)
grid on

%Tension IGBT
subplot(2,1,2)
plot(Time,DCNVigbt,hach4quadrants.time,IGBTH.signals.values(:,2) )
xlim([0.513,0.523]);
xlabel('Temps (sec)','FontSize',15)
ylabel('Tension (V)','FontSize',15)

