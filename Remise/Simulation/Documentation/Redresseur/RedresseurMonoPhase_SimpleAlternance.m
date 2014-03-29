%Sample time
Tpas = 1e-6;

SamplingGraph = 0.0001;

%Angle d'ammorcage en pourcent
Time = 1/60;
PhaseDelay = 10/100;
Modulation = 50/100;
Ton = (PhaseDelay * Time)/2;
Toff = (PhaseDelay + (Modulation))/2 * Time;


%Paramètres réseau
Freq = 60;
Rad = 2 * pi * Freq;
Vac = 1;
R = 1;
L = 0.001;
Tau = L/R;
Z = sqrt(R^2 + (Rad * L)^2);
PhaseCourant = atan(Rad * L / R);

t = 0:SamplingGraph:Time;

Vin = Vac*sin(Rad*t);
VChargeTemp = Vin;
VinCourant = Vac*sin(Rad*t - PhaseCourant);
itemp = VinCourant .* exp(-t/Tau)/Z + VinCourant/Z;

%Application des seuils
i = zeros(1, length(itemp));
VCharge = zeros(1, length(VChargeTemp));
i(Ton/SamplingGraph : Toff/SamplingGraph) = itemp(Ton/SamplingGraph : Toff/SamplingGraph);
VCharge(Ton/SamplingGraph : Toff/SamplingGraph) = VChargeTemp(Ton/SamplingGraph : Toff/SamplingGraph);

plot(t,i, t, VCharge)


Vmoy = Vac / Time * (cos(Rad *Ton) - cos(Rad * Toff))/Rad 
Imoy = 1