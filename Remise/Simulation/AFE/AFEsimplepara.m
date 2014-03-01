clear;
clc;
%On d�clare les variables
%Inductance de source ac
Lac = 0.0020;

%Tension AC
Vac = 2000;
%Fr�quence r�seau
Freq = 50;
%Pas de simulation
Tpas = 1e-5;
%angle theta du courant
Phase = 45;
%Valeur max du courant: La relation avec la tension trouv�e par inspection est U = Imax/cos(theta) 
Iac = 3430;
%R�sistance charge
Rac = 2.5;
%Seuil hyst�r�sis
hys = 0.1;
%tension de ref�rence dc
Vdc = 5000;


