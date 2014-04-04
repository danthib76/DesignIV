a=100;
b=0;

%AFE 2 level hystérésis RC
Te = linspace(0,1,length(ScopeData.signals(3).values));
T =linspace(0,1,length(Psim));
figure(1);
plot(Te,ScopeData.signals(3).values(:,1),Te,ScopeData.signals(3).values(:,2),T,Psim(:,2));
title('Tension au niveau du condensateur');
ylabel('Tension (V)');
xlabel('Temps (s)');
legend('Référence','Simulink','Psim')
ylim([4850,5150])


for i=1:length(Psim)
    %Calcul erreur SPS/PSIM tension bus
    D(i)=ScopeData.signals(3).values((round(i*1.666666666666)),2);
    
end
for i=1:length(Psim)
    %Calcul erreur SPS/PSIM tension bus
    B(i)=abs((abs(D(i))-abs(Psim(i,2)))./abs(D(i)))*100; 
end
figure(2);
plot(T,B);
title('Erreur tension du bus SPS/PSIM');
ylabel('Pourcentage (%)');
xlabel('Temps (s)');
ylim([0,0.3])
Pourcentage_de_differences_de_tension_bus_entre_Psim_et_Simulink = mean(B)

%Courant du bus
figure(3);
plot(Te,ScopeData.signals(4).values,T,Ibus(:,2));
title('Courant au niveau du condensateur');
ylabel('Courant (A)');
xlabel('Temps (s)');
legend('Simulink','Psim')

for i=1:length(Psim)
    %Calcul erreur SPS/PSIM courant bus
    E(i)=ScopeData.signals(4).values((round(i*1.666666666666)));
    
end
for j=1:length(Psim)/a
    %Calcul erreur SPS/PSIM courant bus fenetrage de 100 echantillons
    F(j)=abs((abs(mean(E(1+b:a+b)))-abs(mean(Ibus(1+b:a+b,2))))./abs(mean(E(1+b:a+b))))*100; 
    b=b+a;
end
b=0;
for j=1:length(Psim)/a
    %Calcul erreur SPS/PSIM courant bus fenetrage de 100 echantillons
    Q(j)=mean(F(1+b:a+b));
    b=b+a;
end
Tcou = linspace(0,1,length(Psim)/a);
figure(4);
plot(Tcou,Q);
title('Erreur courant du bus SPS/PSIM par fenêtrage de 100 échantillons');
ylabel('Pourcentage (%)');
xlabel('Temps (s)');

Pourcentage_de_differences_de_courant_bus_entre_Psim_et_Simulink = mean(F)