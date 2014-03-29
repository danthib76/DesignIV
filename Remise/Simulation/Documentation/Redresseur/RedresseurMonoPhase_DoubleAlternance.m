%Sample time
Tpas = 1e-6;

SamplingGraph = 0.0001;

%Angle d'ammorcage en pourcent
Time = 1/120;
PeriodNumber = 20;

PhaseDelay = 0;
Modulation = 1;
Ton = (PhaseDelay * Time)/2;
Toff = (PhaseDelay + (Modulation))/2 * Time;


%Paramètres réseau
Freq = 60;
Rad = 2 * pi * Freq;
Vac = sqrt(2) * 120;
R = 2.5;
L = 0.5;
Tau = L/R;
Z = sqrt(R^2 + (Rad * L)^2);
PhaseCourant = atan(Rad * L / R);

E = 10 / R

t = 0:SamplingGraph:Time;

Vin = Vac*sin(Rad*t);
VChargeTemp = Vin;
VinCourant = Vac*sin(Rad*t - PhaseCourant);
itemp = VinCourant .* exp(-t/Tau)/Z + VinCourant/Z;
I0 = (Vac * sin(PhaseCourant)/Z) * (1+exp(-pi/(Tau*Rad))/(1-exp(-pi/(Tau*Rad))));


I0 - 10/2.5

i = Vac / Z * (sin(rad * t - PhaseCourant) + 2 * sin(PhaseCourant) * exp(-t/Tau)/(1-exp(-R*pi/(L * rad))))

test= (Vac * sin(pi - PhaseCourant)/Z - Vac * sin(-PhaseCourant)/Z * exp((-R/L)*(pi/Rad)))/(1-exp(-R*pi/(L * rad)))
%  i =  VinCourant / Z + (test - Vac * sin(-PhaseCourant)/Z) * exp(-(R/L)*t);
plot(t, i)
