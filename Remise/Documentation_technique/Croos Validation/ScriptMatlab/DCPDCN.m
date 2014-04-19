A = DCPDCN.signals(1).values(:,2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Section à décommenter pour un pas inférieure à 50u
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%Courant à la charge
figure(1)
subplot(4,1,1)
plot(Time,IMagnet,DCPDCN.time, A,Time,IRef)
legend('PSIM','SPS','REF')
xlim([0,0.9]);
ylim([-1000,7000])
xlabel('Temps (sec)','FontSize',15)
ylabel('Courant (A)','FontSize',15)
grid on

%Courant à la charge
subplot(4,1,2)
plot(Time,IMagnet,DCPDCN.time, A,Time,IRef)
xlim([0.495,0.505]);
ylim([5970,6020]);
xlabel('Temps (sec)','FontSize',15)
ylabel('Courant (A)','FontSize',15)
grid on

%Courant à la charge
subplot(4,1,3)
plot(Time,IMagnet,DCPDCN.time, A,Time,IRef)
xlim([0.455,0.465]);
ylim([5400,5600]);
xlabel('Temps (sec)','FontSize',15)
ylabel('Courant (A)','FontSize',15)
grid on

%Courant à la charge
subplot(4,1,4)
plot(Time,IMagnet,DCPDCN.time, A,Time,IRef)
xlim([0.122,0.132]);
ylim([800,1050]);
xlabel('Temps (sec)','FontSize',15)
ylabel('Courant (A)','FontSize',15)
grid on

%Tension à la charge
figure(2)
subplot(2,1,1)
plot(Time,VMagnet,DCPDCN.time,DCPDCN.signals(2).values(:,1) )
legend('PSIM','SPS')
xlim([0,0.9])
ylim([-5500,5500])
xlabel('Temps (sec)','FontSize',15)
ylabel('Tension (V)','FontSize',15)
grid on

%Tension à la charge
subplot(2,1,2)
plot(Time,VMagnet,DCPDCN.time,DCPDCN.signals(2).values(:,1) )
xlim([0.455,0.465]);
ylim([-5500,5500])
xlabel('Temps (sec)','FontSize',15)
ylabel('Tension (V)','FontSize',15)
grid on

%Courant IGBT
figure(3)
subplot(2,1,1)
plot(Time,DCPIgbtI,DCPDCN.time,DCPDCN.signals(5).values(:,1))
legend('PSIM','SPS')
xlim([0,0.9])
ylim([-1000,7000])
xlabel('Temps (sec)','FontSize',15)
ylabel('Courant (A)','FontSize',15)
grid on

%Courant IGBT
subplot(2,1,2)
plot(Time,DCPIgbtI,DCPDCN.time,DCPDCN.signals(5).values(:,1) )
xlim([0.513,0.523]);
ylim([-1000,7000])
xlabel('Temps (sec)','FontSize',15)
ylabel('Courant (A)','FontSize',15)
grid on

%Tension IGBT
figure(4)
subplot(2,1,1)
plot(Time,DCPVigbt,DCPDCN.time,DCPDCN.signals(6).values(:,1))
legend('PSIM','SPS')
xlim([0,0.9])
ylim([-1000,3000])
xlabel('Temps (sec)','FontSize',15)
ylabel('Tension (V)','FontSize',15)
grid on

%Tension IGBT
subplot(2,1,2)
plot(Time,DCPVigbt,DCPDCN.time,DCPDCN.signals(6).values(:,1)) 
xlim([0.513,0.523]);
xlabel('Temps (sec)','FontSize',15)
ylabel('Tension (V)','FontSize',15)
grid on



