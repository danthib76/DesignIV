clear;
clc;
%On déclare les variables
%Inductance de source ac
Lac = 0.0020;

%Tension AC
Vac = 2000;
%Fréquence réseau
Freq = 50;
%Pas de simulation
Tpas = 1e-5;
%angle theta du courant
Phase = 45;
%Valeur max du courant: La relation avec la tension trouvée par inspection est U = Imax/cos(theta) 
Iac = 3430;
%Résistance charge
Rac = 2.5;
%Seuil hystérésis
hys = 0.1;
%tension de reférence dc
Vdc = 5000;


