% Problem Data Dic_Test_pont_Pv3
% Calcul du PI discret en parallel form à partir de la synthèse du PI
% continu
clear all
% DC Voltage Source (V)
Eb=5000;
% Load resistance & Inductance (electromagnets)
R=.28; 
L=.1;
% PI saturation limiter +Sat -Sat
Sat = .95;
%  PWM Modulation frequency
fmod = 1e3;
% Fixed Time step
Tstep=1e-5;
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







