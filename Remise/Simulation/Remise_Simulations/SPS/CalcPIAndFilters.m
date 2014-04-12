

%PI pour la régulation de courant de l'AFE
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

%PI pour le PWM DCP-DCN
PIcontDCP = tf([1.5611 24.6],[1 0]);
PIdiscDCP  = c2d(PIcontDCP,Tpas);
[Numd,Dend,Ts]=tfdata(PIdiscDCP, 'v');
PDCP=Numd(1)/Dend(1);
IDCP=(PDCP+Numd(2)/Dend(1))/Ts;

%PI pour l'AFE PWM
PIcontAFE = tf([150 12000],[1 0]);
PIdiscAFE  = c2d(PIcontAFE,Tpas);
[Numd,Dend,Ts]=tfdata(PIdiscAFE, 'v');
PAFE3L=Numd(1)/Dend(1);
IAFE3L=(PAFE3L+Numd(2)/Dend(1))/Ts;

%PI pour le hacheur 4 Quadrants
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
P4Q=Numd(1)/Dend(1);
I4Q=(P4Q+Numd(2)/Dend(1))/Ts;
%P4Q = 0.071;
%I4Q = 0.02;

% Time constant current Low Pass Filter (ripple)
% aussi 
Trip = .005;
% Continuous Low Pass filter (ripple)
LPrip = tf(1,[Trip,1]);
% Discretization of Low Pass filter in z with Tstep
LPripdisc=c2d(LPrip,Tpas);
% Calcul des coeff du Low Pass filter discret de simulink
[NLPripd,DLPripd,Ts]=tfdata(LPripdisc, 'v');
KLP4Q=NLPripd(2);
TLP4Q=DLPripd(2);
%KLP4Q=0.01;
%TLP4Q=-0.99;

[KLPDCP,TLPDCP] = ellip(2,0.01,40,1500*(Tpas/2),'low');

