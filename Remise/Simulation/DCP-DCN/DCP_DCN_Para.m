%On d�clare les variables
clear;
clc;

%Le pas de simulation Garder le pas � 1e-5 pour avoir commutation � 1Khz
Tpas = 1e-5;
%La fr�quence fondamentale
Freq = 50;
%tension des sources du bus dc
Vdc = 2500;
%Induction de couplage
Lcoup = 1e-6;
%Valeurs des �lectroaimants
Rch = 0.28;
Lch = 0.1;

%Les param�tres du PI
P = 1.5611;
I = 24.6;

%Les param�tres du filtre (Code de discretisation de filtre venant de
%VIarouge)
Trip = .00091;
% Continuous Low Pass filter (ripple)
LPrip = tf([1],[Trip,1]);
% Discretization of Low Pass filter in z with Tstep
LPripdisc=c2d(LPrip,Tpas);
% Calcul des coeff du Low Pass filter discret de simulink
[NLPripd,DLPripd,Ts]=tfdata(LPripdisc, 'v');
KLP=NLPripd(2);
TLP=DLPripd(2);