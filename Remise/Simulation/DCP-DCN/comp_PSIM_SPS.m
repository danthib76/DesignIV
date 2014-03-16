C=cell2mat(A);
for i=1:length(A)
    B(i)=abs((C(i,3)-C(i,2))./C(i,3))*100;
    T(i) = C(i,1);
end

for i=1:length(ScopeData.signals(1).values)
    D(i)=abs((ScopeData.signals(1).values(i,1)-ScopeData.signals(1).values(i,2))./ScopeData.signals(1).values(i,1))*100;
    
end
for i=1:length(A)
   E(i)=abs((ScopeData.signals(1).values(i,2)-C(i,2))/(ScopeData.signals(1).values(i,2)))*100;
    
end
Pourcentage_de_differences_du_courant_entre_Psim_et_Simulink = (mean(ScopeData.signals(1).values(:,2))-mean(C(:,2)))/mean(ScopeData.signals(1).values(:,2))*100


Te = linspace(0,0.9,length(ScopeData.signals(1).values));
figure(1);
plot(Te,D);
title('Erreur courant de charge SPS');
ylabel('Pourcentage d''erreur');
xlabel('Temps (s)');

figure(2);
plot(T,B)
title('Erreur courant de charge PSIM')
ylabel('Pourcentage d''erreur')
xlabel('Temps (s)')
% 
figure(3);
plot(T,E)
title('Comparaison SPS/PSIM')
ylabel('Pourcentage d''erreur')
xlabel('Temps (s)')

