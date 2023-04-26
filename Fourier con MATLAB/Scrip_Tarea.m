%{
syms t T0 k

%----Potencia promedio----%

Potencia_prom_x = 1/T0*[int(((-4/T0)*t - 3)^2,t,-T0, -T0+(T0/4))+ int(((4/T0)*t + 1)^2,t,-T0/4,0)]

Potencia_prom_y = 6*(1/(6*T0)*[int(((4/T0)*t + 1)^2,t,-T0/4,0) + int(((-4/T0)*t + 1)^2,t,0,T0/4)])
k = 8; 
ck_x = 1/T0*[int(((-4/T0)*t - 3)*exp(-i*2*pi*k/T0*t),t,-T0, -T0+(T0/4))+ int(((4/T0)*t + 1)*exp(-i*2*pi*k/T0*t),t,-T0/4,0)];
%}

t= (0:8191)/8192;
T=1/50;

%----Espectro de Frecuencias----%

k = -50:50;
Ck_x =((1/4)*(sinc((1/4)*k)).^2);
Ck_y = ((1/24)*(sinc(k/24)).^2).*(1 + exp(-1j*0.38*pi*k) + exp(-1j*pi*(49/60)*k) + exp(-1j*pi*k) + exp(-1j*pi*(89/75)*k) + exp(-1j*pi*(43/24)*k));
subplot(3,1,1)
stem(k/T,abs(Ck_x),'filled','r')
hold on
stem(k/(6*T),abs(Ck_y),'filled','b')
title('Módulo de la Transformada de Fourier de x(t) y (t)')
xlabel('f')
ylabel('F|X(f)| y |FY(f)|')
xlim([-400,400])
ylim([0,0.26]);
legend('Espectro de x(t)','Espectro de y(t)');


%----Reconstruccion x(t)----%

serie = 0;

for k=-100:100
Ck_x= ((1/4)*(sinc((1/4)*k)).^2);  
s = Ck_x .*exp(1j*2*pi*(k/T)*t);
serie = serie + s;
end
subplot(3,1,2)
plot(t,real(serie))
title('Funcion y(t)')
xlabel('t')
ylabel('x(t)')
ylim([-0.02,1]);
%sound(real(serie))

%----Reconstrucion y(t)----%

serie = 0;
for k=-100:100
Ck_y =((1/24)*(sinc(k/24))^2)*(1 + exp(-1j*0.38*pi*k) + exp(-1j*pi*(49/60)*k) + exp(-1j*pi*k) + exp(-1j*pi*(89/75)*k) + exp(-1j*pi*(43/24)*k)); 
s = Ck_y .* exp(1j*2*pi*(k/(6*T))*t);
serie = serie + s;
end
subplot(3,1,3)
plot(t,real(serie))
title('Funcion y(t)')
xlabel('t')
ylabel('y(t)')
ylim([-0.02,1]);
%sound(real(serie))


