clc;
clear all;
%On déclare les variables
%Inductance de source ac L = (0.16pu/(100*pi))*1.6
Lac =  8.1487e-04;
%Tension AC
Vac = 2000;
%Fréquence réseau
Freq = 50;
%Pas de simulation
Tpas = 1e-6;
% Capacité bus CC
Cbus=300e-3;
%Résistance charge obtenu par la puissance moyenne R = 5000/(2.7MW/5000)
Rch = 5000^2/2.7e6;
%Seuil hystérésis
hys = 450;
%Gain pour transformation unitaire de la tension de référence
Kac = 1/(Vac*sqrt(2/3));
%tension de reférence dc
Vdc = 5000;

%Valeurs de l'électroaimant
R=.28; 
L=.1;

%Valeurs de l'inductance de couplage
Lcoup = 10e-6;

%Valeurs des snubbers et IGBT
Rs = 100000;
Cs = inf;
Ron =1e-3;

% Régulateur de tension
% Calcul du PI discret en parallel form à partir de la synthèse du PI
% continu
% PI saturation limiter +Sat -Sat
Satv = 1500;
% proportionnal Gain 
gainv=1;
% Synthèse du PI continuous  1+Tm*s/(Ti*s)
% choix de Ti et Tm 
% on compense cte de temps dominante Rch*Cbus par Tm
Tmv=Rch*Cbus;
% 1/Ti ajuste le gain de la FT corrigée
Tiv=1/(gainv*Rch);
% System Continuous PI controller
PIcontv = tf([Tmv,1],[Tiv,0]);
% Discretization of PI in z with Tstep
PIdiscv=c2d(PIcontv,Tpas);
% Calcul des coeff PI du PI discret de simulink
[Numdv,Dendv,Tsv]=tfdata(PIdiscv, 'v');
% Réglages initiaux calculés
Pv=Numdv(1)/Dendv(1);
Iv=(Pv+Numdv(2)/Dendv(1))/Tsv;

%PI pour la régulation d'angle
PIcont = tf([0.48,8],[1,0]);
% Discretization of PI in z with Tstep
PIdisc=c2d(PIcont,Tpas);
% Calcul des coeff PI du PI discret de simulink
[Numd,Dend,Ts]=tfdata(PIdisc, 'v');
P=Numd(1)/Dend(1);
I=(P+Numd(2)/Dend(1))/Ts;

%PI pour le PWM H4Q
PC = 0.001;
IC = 2;

%PI pour le PWM DCP-DCN
PIcontDCP = tf([1.5611 24.6],[1 0]);
PIdiscDCP  = c2d(PIcontDCP,Tpas);
[Numd,Dend,Ts]=tfdata(PIdiscDCP, 'v');
PDCP=Numd(1)/Dend(1);
IDCP=(PDCP+Numd(2)/Dend(1))/Tpas;



%PI pour l'AFE PWM
PIcontAFE = tf([150 12000],[1 0]);
PIdiscAFE  = c2d(PIcontAFE,Tpas);
[Numd,Dend,Ts]=tfdata(PIdiscAFE, 'v');
PAFE3L=Numd(1)/Dend(1);
IAFE3L=(PAFE3L+Numd(2)/Dend(1))/Ts;



%PI pour le hacheur 4 Quadrants
%Saturation du PI
SatPIH4Q = .95;
%Fréquence de modulation du hacheur 4Quadrants
fmod4Q = 1e3;
% proportionnal Gain 
gain=.02;
% PI proportionnal PI form: ideal P(1+I*1/s) Anti-windup : clamping
%P = gain*L/R;
%I = R/L;
% Synthèse du PI continuous  1+Tm*s/(Ti*s)
% choix de Ti et Tm 
% on compense cte de temps dominante L\R par Tm
Tm=L/R;
% 1/Ti ajuste le gain de la FT corrigée
Ti=1/gain;
% System Continuous PI controller
PIcont = tf([Tm,1],[Ti,0]);
% Discretization of PI in z with Tstep
PIdisc=c2d(PIcont,Tpas);
% Calcul des coeff PI du PI discret de simulink
[Numd,Dend,Ts]=tfdata(PIdisc, 'v');
% P4Q=Numd(1)/Dend(1);
% I4Q=(P4Q+Numd(2)/Dend(1))/Ts;
P4Q = 0.071;
I4Q = 0.02;

% Time constant current Low Pass Filter (ripple)
% aussi 
Trip = .005;
% Continuous Low Pass filter (ripple)
LPrip = tf(1,[Trip,1]);
% Discretization of Low Pass filter in z with Tstep
LPripdisc=c2d(LPrip,Tpas);
% Calcul des coeff du Low Pass filter discret de simulink
[NLPripd,DLPripd,Ts]=tfdata(LPripdisc, 'v');
% KLP4Q=NLPripd(2);
% TLP4Q=DLPripd(2);
 KLP4Q=0.01;
 TLP4Q=-0.99;

[KLPDCP,TLPDCP] = ellip(2,0.01,40,1500*(Tpas/2),'low');

