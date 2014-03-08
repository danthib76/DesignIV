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
Te = linspace(0,0.9,length(ScopeData.signals(1).values));
plot(Te,D);
title('Erreur courant de charge SPS');
ylabel('Pourcentage d''erreur');
xlabel('Temps (s)');

plot(T,B)
title('Erreur courant de charge PSIM')
ylabel('Pourcentage d''erreur')
xlabel('Temps (s)')

plot(T,E)
title('Comparaison SPS/PSIM')
ylabel('Pourcentage d''erreur')
xlabel('Temps (s)')

