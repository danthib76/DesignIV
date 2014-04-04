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
% Capacité bus CC
Cbus=300e-3;
%Résistance charge obtenu par la puissance moyenne R = 5000/(2.7MW/5000)
Rch = 9.26;
%Seuil hystérésis
hys = 150;
%gain mise mesure des références tension en pu
Kac = 1/(Vac*sqrt(2/3))
%tension de reférence dc
Vdc = 5000;
%Courant max dans la charge
Imax = 1500;


