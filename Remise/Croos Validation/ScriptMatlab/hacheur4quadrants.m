A = hacheur4quadrants.signals(1).values(1:length(hacheur4quadrants.signals(1).values)-1,2);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Section à décommenter pour un pas inférieure à 50u
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% %Courant à la charge
% figure(1)
% subplot(4,1,1)
% plot(Time,IMagnet,Time, A,Time,IRef)
% legend('PSIM','SPS','REF')
% xlim([0,0.9]);
% ylim([-1000,7000])
% xlabel('Temps (sec)','FontSize',15)
% ylabel('Courant (A)','FontSize',15)
% grid on
% 
% %Courant à la charge
% subplot(4,1,2)
% plot(Time,IMagnet,Time, A,Time,IRef)
% xlim([0.495,0.505]);
% ylim([5970,6020]);
% xlabel('Temps (sec)','FontSize',15)
% ylabel('Courant (A)','FontSize',15)
% grid on
% 
% %Courant à la charge
% subplot(4,1,3)
% plot(Time,IMagnet,Time, A,Time,IRef)
% xlim([0.455,0.465]);
% ylim([5400,5600]);
% xlabel('Temps (sec)','FontSize',15)
% ylabel('Courant (A)','FontSize',15)
% grid on
% 
% %Courant à la charge
% subplot(4,1,4)
% plot(Time,IMagnet,Time, A,Time,IRef)
% xlim([0.122,0.132]);
% ylim([800,1050]);
% xlabel('Temps (sec)','FontSize',15)
% ylabel('Courant (A)','FontSize',15)
% grid on
% 
% %Tension à la charge
% figure(2)
% subplot(2,1,1)
% plot(Time,VMagnet,Time,hacheur4quadrants.signals(2).values(1:length(hacheur4quadrants.signals(1).values)-1,1) )
% legend('PSIM','SPS')
% xlim([0,0.9])
% xlabel('Temps (sec)','FontSize',15)
% ylabel('Tension (V)','FontSize',15)
% grid on
% 
% %Tension à la charge
% subplot(2,1,2)
% plot(Time,VMagnet,Time,hacheur4quadrants.signals(2).values(1:length(hacheur4quadrants.signals(1).values)-1,1) )
% xlim([0.455,0.465]);
% ylim([-5500,5500])
% xlabel('Temps (sec)','FontSize',15)
% ylabel('Tension (V)','FontSize',15)
% grid on
% 
% %Courant IGBT
% figure(3)
% subplot(2,1,1)
% plot(Time,DCNIigbt,Time,hacheur4quadrants.signals(5).values(1:length(hacheur4quadrants.signals(1).values)-1,1) )
% legend('PSIM','SPS')
% xlim([0,0.9])
% ylim([-1000,7000])
% xlabel('Temps (sec)','FontSize',15)
% ylabel('Courant (A)','FontSize',15)
% grid on
% 
% %Courant IGBT
% subplot(2,1,2)
% plot(Time,DCNIigbt,Time,hacheur4quadrants.signals(5).values(1:length(hacheur4quadrants.signals(1).values)-1,1) )
% xlim([0.513,0.523]);
% xlabel('Temps (sec)','FontSize',15)
% ylabel('Courant (A)','FontSize',15)
% 
% 
% %Tension IGBT
% figure(4)
% subplot(2,1,1)
% plot(Time,DCNVigbt,Time,hacheur4quadrants.signals(6).values(1:length(hacheur4quadrants.signals(1).values)-1,1) )
% legend('PSIM','SPS')
% xlim([0,0.9])
% ylim([-1000,7000])
% xlabel('Temps (sec)','FontSize',15)
% ylabel('Tension (V)','FontSize',15)
% grid on
% 
% %Tension IGBT
% subplot(2,1,2)
% plot(Time,DCNVigbt,Time,hacheur4quadrants.signals(6).values(1:length(hacheur4quadrants.signals(1).values)-1,1) )
% xlim([0.513,0.523]);
% xlabel('Temps (sec)','FontSize',15)
% ylabel('Tension (V)','FontSize',15)




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%Section à décommenter pour un pas de 50u
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%Courant à la charge
figure(1)
subplot(4,1,1)
plot(Time,IMagnet,Time, A,Time,IRef)
legend('PSIM','SPS','REF')
xlim([0,0.9]);
ylim([-1000,7000])
xlabel('Temps (sec)','FontSize',15)
ylabel('Courant (A)','FontSize',15)
grid on

%Courant à la charge
subplot(4,1,2)
plot(Time,IMagnet,Time, A,Time,IRef)
xlim([0.495,0.505]);
ylim([5920,6080]);
xlabel('Temps (sec)','FontSize',15)
ylabel('Courant (A)','FontSize',15)
grid on

%Courant à la charge
subplot(4,1,3)
plot(Time,IMagnet,Time, A,Time,IRef)
xlim([0.455,0.465]);
ylim([5400,5700]);
xlabel('Temps (sec)','FontSize',15)
ylabel('Courant (A)','FontSize',15)
grid on

%Courant à la charge
subplot(4,1,4)
plot(Time,IMagnet,Time, A,Time,IRef)
xlim([0.122,0.132]);
ylim([800,1300]);
xlabel('Temps (sec)','FontSize',15)
ylabel('Courant (A)','FontSize',15)
grid on

%Tension à la charge
figure(2)
subplot(2,1,1)
plot(Time,VMagnet,Time,hacheur4quadrants.signals(2).values(1:length(hacheur4quadrants.signals(1).values)-1,1) )
legend('PSIM','SPS')
xlim([0,0.9])
xlabel('Temps (sec)','FontSize',15)
ylabel('Tension (V)','FontSize',15)
grid on

%Tension à la charge
subplot(2,1,2)
plot(Time,VMagnet,Time,hacheur4quadrants.signals(2).values(1:length(hacheur4quadrants.signals(1).values)-1,1) )
xlim([0.455,0.465]);
ylim([-5500,5500])
xlabel('Temps (sec)','FontSize',15)
ylabel('Tension (V)','FontSize',15)
grid on

%Courant IGBT
figure(3)
subplot(2,1,1)
plot(Time,DCNIigbt,Time,hacheur4quadrants.signals(5).values(1:length(hacheur4quadrants.signals(1).values)-1,1) )
legend('PSIM','SPS')
xlim([0,0.9])
ylim([-1000,7000])
xlabel('Temps (sec)','FontSize',15)
ylabel('Courant (A)','FontSize',15)
grid on

%Courant IGBT
subplot(2,1,2)
plot(Time,DCNIigbt,Time,hacheur4quadrants.signals(5).values(1:length(hacheur4quadrants.signals(1).values)-1,1) )
xlim([0.513,0.523]);
xlabel('Temps (sec)','FontSize',15)
ylabel('Courant (A)','FontSize',15)


%Tension IGBT
figure(4)
subplot(2,1,1)
plot(Time,DCNVigbt,Time,hacheur4quadrants.signals(6).values(1:length(hacheur4quadrants.signals(1).values)-1,1) )
legend('PSIM','SPS')
xlim([0,0.9])
ylim([-1000,7000])
xlabel('Temps (sec)','FontSize',15)
ylabel('Tension (V)','FontSize',15)
grid on

%Tension IGBT
subplot(2,1,2)
plot(Time,DCNVigbt,Time,hacheur4quadrants.signals(6).values(1:length(hacheur4quadrants.signals(1).values)-1,1) )
xlim([0.513,0.523]);
xlabel('Temps (sec)','FontSize',15)
ylabel('Tension (V)','FontSize',15)

