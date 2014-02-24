% Problem Data Test_pont_Pv2
clear all
% DC Voltage Source (V)
Eb=5000;
% Load resistance & Inductance (electromagnets)
R=.28; 
L=.1;
% PI saturation limiter +Sat -Sat
Sat = .95;
%  PWM Modulation frequency
fmod = 1e3;
% Time constant current Low Pass Filter (ripple)
Trip = .005;
% Fixed Time step
Tstep=1e-5;
% proportionnal Gain 
gain=.02
% PI proportionnal PI form: ideal P(1+I*1/s) Anti-windup : clamping
P = gain*L/R;
I = R/L;



