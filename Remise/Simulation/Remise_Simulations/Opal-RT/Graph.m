time1 = ScopeData.time;
Curve1 = ScopeData.signals(1).values(:,2);

Curve2 = transpose(opvar2(3,1:length(time1)));
Curve3 = ScopeData.signals(1).values(:,1);

plot(time1,[Curve1 Curve2 Curve3])
xlabel('Temps (sec)','FontSize',15)
ylabel('Ampère (A)','FontSize',15)
title('Courant dans l''électroaimant','FontSize',15)
legend('Simulation SPS', 'Simulation Opal-RT', 'Courbe de référence')

