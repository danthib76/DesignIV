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
Tpas = 5e-6;
%Resistance charge obtenu par la puissance moyenne R = 5000/(2.7MW/5000)
R = 9.26;
%Capacité du banc de condensateur
C = 300e-3;
%Resistance charge obtenu par la puissance moyenne R = 5000/(2.7MW/5000)
Rch = 9.26;
%Seuil hystérésis
hys = 450;
%tension de reference dc
Vdc = 5000;
%Courant maximal
Imax = 1.4697e+03;
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
%Continuous phase PI controller for phase control tuned manually
PIcont = tf([0.48,8],[1,0]);
% Discretization of PI in z with Tstep
PIdisc=c2d(PIcont,Tpas);
% Calcul des coeff PI du PI discret de simulink
[Numd,Dend,Ts]=tfdata(PIdisc, 'v');
P=Numd(1)/Dend(1);
I=(P+Numd(2)/Dend(1))/Ts;

%Continuous phase PI controller for Imax control tuned manually
PIcont2 = tf([5,20],[1,0]);
% Discretization of PI in z with Tstep
PIdisc2=c2d(PIcont2,Tpas);
% Calcul des coeff PI du PI discret de simulink
[Numd2,Dend2,Ts2]=tfdata(PIdisc2, 'v');
P2=Numd2(1)/Dend2(1);
I2=(P2+Numd2(2)/Dend2(1))/Ts2;