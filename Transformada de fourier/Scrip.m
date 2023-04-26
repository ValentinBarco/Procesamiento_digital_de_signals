t=0.01
f0=1000
%{

%----Ejercicio 1----%

f = -2000:10:2000;
X_f = (1/2)*(t*sinc(t*(f-f0))+t*sinc(t*(f+f0)));

subplot(1,1,1)
plot(f,X_f,'r')
title('Espectro de x(t)')
xlabel('f')
ylabel('X(f)')

legend('Espectro de x(t)','Espectro de y(t)');
%}

%----Ejercicio 2----%

T0= 0.001
f = -15000:50:15000;
X_f = (1/2).*[exp(-1j*2*pi*f*(T0/2))*T0.*(sinc(T0*[f-(1/T0)]) + sinc(T0*[f+(1/T0)]))+ exp(-1j*2*pi*f*((3*T0)/2))*T0.*(sinc(T0*[f-(10/T0)]) + sinc(T0*[f+(10/T0)]))];

subplot(2,1,1)
plot(f,abs(X_f),'r')
title('Espectro de x(t)')
xlabel('f')
ylabel('|X(f)|')
subplot(2,1,2)
plot(f,unwrap(angle(X_f)),'r')
title('Angulo del espectro de x(t)')
xlabel('f')
ylabel('Arg[X(f)]')
legend('Espectro de x(t)','Espectro de y(t)');
