
a = 4.5;
b = 100;
w = -pi:1/10:pi;
plot(w,abs((b*exp(-1j*w))./(1-a*exp(-1j*w))))
xlim([-pi, pi]);


%{
w = -pi:1/10:pi;
plot(w,abs(2*cos(w/2)))
xlim([-pi, pi]);
%}