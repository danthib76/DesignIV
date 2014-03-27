%On déclare les variables
clear;
clc;

%Le pas de simulation Garder le pas à 1e-5 pour avoir commutation à 1Khz
Tpas = 1e-5;
%La fréquence fondamentale
Freq = 50;
%La fréquence du calcul de la moyenne de tension (sensibilité depend du pas
%de calcul)
ech = 3000;
%tension des sources du bus dc
Vdc = 2500;
%Induction de couplage
Lcoup = 10e-6;
%Valeurs des électroaimants
Rch = 0.28;
Lch = 0.1;
%Valeurs des snubbers
Rs = 100000;
Cs = inf;
%Résistance IGBT
Ron =10e-3;

%Les paramètres du PI
P = 1.5611;
I = 24.6;

%Les paramètres du filtre
[KLP,TLP] = ellip(2,0.01,40,1500*(Tpas/2),'low');

% %Les paramètres du filtre (Code de discretisation de filtre venant de
% %VIarouge)
% Trip = .001;
% % Continuous Low Pass filter (ripple)
% LPrip = tf([1],[Trip,1]);
% % Discretization of Low Pass filter in z with Tstep
% LPripdisc=c2d(LPrip,Tpas);
% % Calcul des coeff du Low Pass filter discret de simulink
% [NLPripd,DLPripd,Ts]=tfdata(LPripdisc, 'v');
% KLP=NLPripd(2);
% TLP=DLPripd(2);