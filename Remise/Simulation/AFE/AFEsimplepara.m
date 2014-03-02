clear;
clc;
%On déclare les variables
%Inductance de source ac L = (0.16pu/(100*pi))*1.6
Lac =  8.1487e-04;


%Tension AC
Vac = 2000;
%Fréquence réseau
Freq = 50;
%Pas de simulation
Tpas = 5e-5;
%Déphasage du courant avec la tension
Phase = 0;
%Résistance charge obtenu par la puissance moyenne R = 5000/(2.7MW/5000)
Rch = 9.26;
%Seuil hystérésis
hys = 0.0001;
%tension de reférence dc
Vdc = 5000;

