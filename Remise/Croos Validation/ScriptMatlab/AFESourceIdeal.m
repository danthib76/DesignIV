P = AFESourceIdeal.signals(1).values(:,2);%45
Q = AFESourceIdeal.signals(2).values(:,2);%45
P1 = AFESourceIdeal11.signals(1).values(:,2);%135
Q1 = AFESourceIdeal11.signals(2).values(:,2);%135
P2 = AFESourceIdeal22.signals(1).values(:,2);%-45
Q2 = AFESourceIdeal22.signals(2).values(:,2);%-45
P3 = AFESourceIdeal33.signals(1).values(:,2);%-135
Q3 = AFESourceIdeal33.signals(2).values(:,2);%-135
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Section à décommenter pour un pas inférieure à 50u
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%Puissance active 45
figure(1)
subplot(2,1,1)
plot(Time,Pmoy,AFESourceIdeal.time, P,Time,Qmoy,AFESourceIdeal.time, Q)
legend('PSIM puissance active','SPS puissance active','PSIM puissance réactive', 'SPS puissance réactive')
xlabel('Temps (sec)','FontSize',15)
ylabel('Puissance (W,VAR)','FontSize',15)
xlim([0,1])
grid on

%Puissance reactive 45
subplot(2,1,2)
plot(Time,PhR,Time,PHRmoy,AFESourceIdeal.time, AFESourceIdeal.signals(3).values(:,1),AFESourceIdeal.time, AFESourceIdeal.signals(3).values(:,2))
xlabel('Temps (sec)','FontSize',15)
ylabel('Phase (degree)','FontSize',15)
legend('PSIM Phase','PSIM Phase moyenne','SPS Phase','SPS Phase moyenne')
xlim([0,1])
grid on

%Puissance active 135
figure(2)
subplot(2,1,1)
plot(Time,Pmoy1,AFESourceIdeal.time, P1,Time,Qmoy1,AFESourceIdeal.time, Q1)
legend('PSIM puissance active','SPS puissance active','PSIM puissance réactive', 'SPS puissance réactive')
xlabel('Temps (sec)','FontSize',15)
ylabel('Puissance (W,VAR)','FontSize',15)
xlim([0,1])
grid on

%Puissance reactive 135
subplot(2,1,2)
plot(Time,PhR1,Time,PHRmoy1,AFESourceIdeal.time, AFESourceIdeal11.signals(3).values(:,1),AFESourceIdeal.time, AFESourceIdeal11.signals(3).values(:,2))
xlabel('Temps (sec)','FontSize',15)
ylabel('Phase (degree)','FontSize',15)
legend('PSIM Phase','PSIM Phase moyenne','SPS Phase','SPS Phase moyenne')
xlim([0,1])
grid on

%Puissance active -45
figure(3)
subplot(2,1,1)
plot(Time,Pmoy2,AFESourceIdeal.time, P2,Time,Qmoy2,AFESourceIdeal.time, Q2)
legend('PSIM puissance active','SPS puissance active','PSIM puissance réactive', 'SPS puissance réactive')
xlabel('Temps (sec)','FontSize',15)
ylabel('Puissance (W,VAR)','FontSize',15)
xlim([0,1])
grid on

%Puissance reactive -45
subplot(2,1,2)
plot(Time,PhR2,Time,PHRmoy2,AFESourceIdeal.time, AFESourceIdeal22.signals(3).values(:,1),AFESourceIdeal.time, AFESourceIdeal22.signals(3).values(:,2))
xlabel('Temps (sec)','FontSize',15)
ylabel('Phase (degree)','FontSize',15)
legend('PSIM Phase','PSIM Phase moyenne','SPS Phase','SPS Phase moyenne')
xlim([0,1])
grid on


%Puissance active -135
figure(4)
subplot(2,1,1)
plot(Time,Pmoy3,AFESourceIdeal.time, P3,Time,Qmoy3,AFESourceIdeal.time, Q3)
legend('PSIM puissance active','SPS puissance active','PSIM puissance réactive', 'SPS puissance réactive')
xlabel('Temps (sec)','FontSize',15)
ylabel('Puissance (W,VAR)','FontSize',15)
xlim([0,1])
grid on

%Puissance reactive -135
subplot(2,1,2)
plot(Time,PhR3,Time,PHRmoy3,AFESourceIdeal.time, AFESourceIdeal33.signals(3).values(:,1),AFESourceIdeal.time, AFESourceIdeal33.signals(3).values(:,2))
xlabel('Temps (sec)','FontSize',15)
ylabel('Phase (degree)','FontSize',15)
legend('PSIM Phase','PSIM Phase moyenne','SPS Phase','SPS Phase moyenne')
xlim([0,1])
grid on


%Courant AC
figure(5)
subplot(2,1,1)
plot(Time,Ia,Time,Ib,Time,Ic)
xlabel('Temps (sec)','FontSize',15)
ylabel('Courant AC (A)','FontSize',15)
xlim([0.5,0.6])
ylim([-2000,2000])
title('Courant d''entrée PSIM','FontSize',15)
grid on



subplot(2,1,2)
plot(AFESourceIdeal.time,ScopeData.signals(2).values)
xlabel('Temps (sec)','FontSize',15)
ylabel('Courant AC (A)','FontSize',15)
xlim([0.5,0.6])
title('Courant d''entrée SPS','FontSize',15)
grid on



