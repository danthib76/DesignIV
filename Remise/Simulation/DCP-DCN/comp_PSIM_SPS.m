
a=100;
b=0;
C=cell2mat(A);
for i=1:length(A)
    %calcul erreur courant point par point pour Psim
    B(i)=abs((abs(C(i,3))-abs(C(i,2)))./abs(C(i,3)))*100;
    T(i) = C(i,1);
end

for i=1:length(ScopeData.signals(1).values)
    %calcul erreur courant point par point pour SPS
    D(i)=abs((abs(ScopeData.signals(1).values(i,1))-abs(ScopeData.signals(1).values(i,2)))./abs(ScopeData.signals(1).values(i,1)))*100;
    
end
for i=1:length(A)
    %calcul erreur courant point par point
   E(i)=abs((abs(ScopeData.signals(1).values(i,2))-abs(C(i,2)))/(abs(ScopeData.signals(1).values(i,2))))*100;
    
end
for i=1:length(A)/a;
    %calcul erreur courant par fenetrage de 100 echantillon
   Cou(i) = mean(E(1+b:a+b));
   b=b+a; 
end

for  i=1:(length(A)-10)
    %Calcul erreur tension moyenne point par point
   F(i)=abs((abs(ScopeData.signals(2).values(i+10,2))-abs(moy1(i+10,2)))/(abs(ScopeData.signals(2).values(i+10,2))))*100;
end
c=0;
for i=1:(length(A)-10)/a;
    %calcul erreur courant par fenetrage de 100 echantillon
   Ten(i) = mean(F(1+c:a+c));
   c=c+a; 
end

Pourcentage_de_differences_du_courant_entre_Psim_et_Simulink = mean(E)

Tcou = linspace(0,0.9,length(A)/a);
Tten = linspace(0,0.9,(length(A)-10)/a);

Te = linspace(0,0.9,length(ScopeData.signals(1).values));
figure(1);
plot(Te,D);
title('Erreur courant de charge SPS avec reference');
ylabel('Pourcentage d''erreur');
xlabel('Temps (s)');
ylim([0,10])

figure(2);
plot(T,B)
title('Erreur courant de charge PSIM avec reference')
ylabel('Pourcentage d''erreur')
xlabel('Temps (s)')
ylim([0,10])
% 
figure(3);
plot(T,E)
title('Comparaison SPS/PSIM')
ylabel('Pourcentage d''erreur')
xlabel('Temps (s)')
ylim([0,20])

Pourcentage_differences_tension_moyenne_entre_Psim_et_Simulink = mean(F)

%Graphe_de_tension_moyenne 
figure(4)
plot(Te,ScopeData.signals(2).values(:,2),T,moy1(:,2))
title('Comparaison SPS/PSIM au niveau de la tension moyenne')
ylabel('Tension moyenne (V)')
xlabel('Temps (s)')
legend('Simulink','Psim')

figure(5)
plot(Te,ScopeData.signals(1).values(:,2),T,C(:,2))
title('Comparaison SPS/PSIM au niveau du courant moyen')
ylabel('Courant moyen (A)')
xlabel('Temps (s)')
legend('Simulink','Psim')

figure(6);
plot(Tcou,Cou);
title('Erreur courant de charge par fenêtrage de 100 échantillons');
ylabel('Pourcentage d''erreur');
xlabel('Temps (s)');
ylim([0,10])

figure(7);
plot(Tten,Ten);
title('Erreur tension moyenne par fenêtrage de 100 échantillons');
ylabel('Pourcentage d''erreur');
xlabel('Temps (s)');



Tenn = linspace(0.1,0.7,((length(A)-10)/a)*0.666666666666666666666666666666666666);
figure(8);
plot(Tenn,Ten(101:(length(A)-10)/a-200));
title('Erreur tension moyenne par fenêtrage de 100 échantillons');
ylabel('Pourcentage d''erreur');
xlabel('Temps (s)');
xlim([0.1,0.7])

figure(9)
plot(Te,ScopeData.signals(1).values(:,2),T,C(:,2))
title('Comparaison Hystérésis courant à la charge')
ylabel('Courant moyen (A)')
xlabel('Temps (s)')
legend('Simulink','Psim')
xlim([0.48,0.50])
ylim([5970,6030])

figure(10)
plot(Te,ScopeData.signals(2).values(:,1),T,moy1(:,3))
title('Comparaison Hystérésis au niveau de la tension à la charge')
ylabel('Tension moyenne (V)')
xlabel('Temps (s)')
legend('Simulink','Psim')
xlim([0.48,0.50])

figure(11)
plot(Te,ScopeData.signals(3).values(:,2),T,I_igbt(:,2))
title('Comparaison courant IGBT')
ylabel('Courant (A)')
xlabel('Temps (s)')
legend('Simulink','Psim')
xlim([0.48,0.50])