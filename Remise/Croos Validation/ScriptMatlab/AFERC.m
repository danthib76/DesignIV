P = PuissanceRC.signals(1).values(:,2);
Q = PuissanceRC.signals(2).values(:,2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Section à décommenter pour un pas inférieure à 50u
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%Puissance active
figure(1)
subplot(2,1,1)
plot(Time,Pmoy,AFESourceRC.time, P)
legend('PSIM','SPS')
xlabel('Temps (sec)','FontSize',15)
ylabel('Puissance active (W)','FontSize',15)
grid on

%Puissance reactive
subplot(2,1,2)
plot(Time,Qmoy,AFESourceRC.time, Q)
xlabel('Temps (sec)','FontSize',15)
ylabel('Puissance Réactive (VAR)','FontSize',15)
grid on

%Courant SPS
figure(2)
subplot(2,1,1)
plot(AFESourceRC.time, AFESourceRC.signals(2).values(:,1),AFESourceRC.time, AFESourceRC.signals(2).values(:,2), AFESourceRC.time, AFESourceRC.signals(2).values(:,3))
xlabel('Temps (sec)','FontSize',15)
ylabel('Courant (A)','FontSize',15)
xlim([0.5,0.52])
grid on

%Courant PSIM
subplot(2,1,2)
plot(Time,V62,Time, V63, Time, V64)
xlabel('Temps (sec)','FontSize',15)
ylabel('Courant (A)','FontSize',15)
xlim([0.5,0.52])
grid on

