clear all;
clc;
%On déclare les variables
%Inductance de source ac L = (0.16pu/(100*pi))*1.6
Lac =  8.1487e-04;
%Tension AC
Vac = 2000;
%Fréquence réseau
Freq = 50;
%Pas de simulation
Tpas = 3e-6;
% Capacité bus CC
Cbus=300e-3
%Résistance charge obtenu par la puissance moyenne R = 5000/(2.7MW/5000)
Rch = 9.26;
%Seuil hystérésis
hys = 150;
%gain mise mesure des références tension en pu
Kac = 1/(Vac*sqrt(2/3))
%tension de reférence dc
Vdc = 5000;
% Régulateur de tension
% Calcul du PI discret en parallel form à partir de la synthèse du PI
% continu
% PI saturation limiter +Sat -Sat
Satv = 5000;
% proportionnal Gain 
gainv=2
% PI proportionnal PI form: ideal P(1+I*1/s) Anti-windup : clamping
%P = gainv*Rch;
%I = 1\(Rch*Cbus);
% Synthèse du PI continuous  1+Tm*s/(Ti*s)
% choix de Ti et Tm 
% on compense cte de temps dominante Rch*Cbus par Tm
Tmv=Rch*Cbus
% 1/Ti ajuste le gain de la FT corrigée
Tiv=1/(gainv*Rch)
% System Continuous PI controller
PIcontv = tf([Tmv,1],[Tiv,0])
% Discretization of PI in z with Tstep
PIdiscv=c2d(PIcontv,Tpas)
% Calcul des coeff PI du PI discret de simulink
[Numdv,Dendv,Tsv]=tfdata(PIdiscv, 'v')
% Réglages initiaux calculés
Pv=Numdv(1)/Dendv(1)
Iv=(Pv+Numdv(2)/Dendv(1))/Tsv
% Problem Data Dic_Test_pont_Pv3 Pont en H
% Calcul du PI discret en parallel form à partir de la synthèse du PI
% continu

% DC Voltage Source (V)
%Eb=5000;
% Load resistance & Inductance (electromagnets)
R=.28; 
L=.1;
% PI saturation limiter +Sat -Sat
Sat = .95;
%  PWM Modulation frequency
fmod = 1e3;
% Fixed Time step
Tstep=Tpas;
% Time constant current Low Pass Filter (ripple) il reste à le discrétiser
% aussi 
Trip = .005;
% Continuous Low Pass filter (ripple)
LPrip = tf([1],[Trip,1])
% Discretization of Low Pass filter in z with Tstep
LPripdisc=c2d(LPrip,Tstep)
% Calcul des coeff du Low Pass filter discret de simulink
[NLPripd,DLPripd,Ts]=tfdata(LPripdisc, 'v')
KLP=NLPripd(2)
TLP=DLPripd(2)
% proportionnal Gain 
gain=.02
% PI proportionnal PI form: ideal P(1+I*1/s) Anti-windup : clamping
%P = gain*L/R;
%I = R/L;
% Synthèse du PI continuous  1+Tm*s/(Ti*s)
% choix de Ti et Tm 
% on compense cte de temps dominante L\R par Tm
Tm=L/R
% 1/Ti ajuste le gain de la FT corrigée
Ti=1/gain
% System Continuous PI controller
PIcont = tf([Tm,1],[Ti,0])
% Discretization of PI in z with Tstep
PIdisc=c2d(PIcont,Tstep)
% Calcul des coeff PI du PI discret de simulink
[Numd,Dend,Ts]=tfdata(PIdisc, 'v')
P=Numd(1)/Dend(1)
I=(P+Numd(2)/Dend(1))/Ts



