clear;
clc;
%On d�clare les variables
%Inductance de source ac L = (0.16pu/(100*pi))*1.6
Lac =  8.1487e-04;


%Tension AC
Vac = 2000;
%Fr�quence r�seau
Freq = 50;
%Pas de simulation
Tpas = 5e-5;
%D�phasage du courant avec la tension
Phase = -45;
%R�sistance charge obtenu par la puissance moyenne R = 5000/(2.7MW/5000)
Rch = 9.26;
%Seuil hyst�r�sis
hys = 0.1;
%tension de ref�rence dc
Vdc = 5000;

