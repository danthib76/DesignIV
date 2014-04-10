P = AFESourceIdeal.signals(1).values(:,2);
Q = AFESourceIdeal.signals(2).values(:,2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Section à décommenter pour un pas inférieure à 50u
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%Puissance active
figure(1)
subplot(2,1,1)
plot(Time,Pmoy,AFESourceIdeal.time, P)
legend('PSIM','SPS')
xlabel('Temps (sec)','FontSize',15)
ylabel('Puissance active (W)','FontSize',15)
grid on

%Puissance reactive
subplot(2,1,2)
plot(Time,Qmoy,AFESourceIdeal.time, Q)
xlabel('Temps (sec)','FontSize',15)
ylabel('Puissance Réactive (VA)','FontSize',15)
grid on





