clear;
clc;
%On declare les variables
%Inductance de source ac L = (0.16pu/(100*pi))*1.6
Lac =  8.1487e-04;
%Tension AC
Vac = 2000;
%Frequence réseau
Freq = 50;
%Pas de simulation
Tpas = 5e-5;
%Resistance charge obtenu par la puissance moyenne R = 5000/(2.7MW/5000)
R = 9.26;
%Capacité du banc de condensateur
C = 300e-3;
%Resistance charge obtenu par la puissance moyenne R = 5000/(2.7MW/5000)
Rch = 9.26;
%Seuil hystérésis
hys = 100;
%tension de reference dc
Vdc = 5000;
%Courant maximal
Imax = 5000;
Sat = 5000;
% PI proportionnal PI form: ideal P(1+I*1/s) Anti-windup : clamping
%P = gain*L/R;
%I = R/L;
% Synthèse du PI continuous  1+Tm*s/(Ti*s)
% choix de Ti et Tm 
% on compense cte de temps dominante L\R par Tm
%Tm= R*C;
% 1/Ti ajuste le gain de la FT corrigée
%Ti=1/(R*C);
% System Continuous PI controller
Tm = 10;
Ti = 0.001;
PIcont = tf([Tm,1],[Ti,0]);
% Discretization of PI in z with Tstep
PIdisc=c2d(PIcont,Tpas);
% Calcul des coeff PI du PI discret de simulink
[Numd,Dend,Ts]=tfdata(PIdisc, 'v');
P=Numd(1)/Dend(1);
I=(P+Numd(2)/Dend(1))/Ts;
Tm1 = 75;
Ti1 = 1;
PIcont1 = tf([Tm1,1],[Ti1,0]);
% Discretization of PI in z with Tstep
PIdisc1=c2d(PIcont1,Tpas);
% Calcul des coeff PI du PI discret de simulink
[Numd1,Dend1,Ts1]=tfdata(PIdisc1, 'v');
P1=Numd1(1)/Dend1(1);
I1=(P1+Numd1(2)/Dend1(1))/Ts1;