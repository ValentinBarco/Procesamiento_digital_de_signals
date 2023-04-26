
T = 1;
fs = 1000;
N_per = 5;

t = -(N_per*T)/2:1/fs:(N_per*T)/2-1/fs;

t_1 = -T/2:1/fs:T/2;
t_1 = t_1(1:length(t_1)-1);
x_1 = zeros(size(t_1));
x_1(t_1>-T/4 & t_1<T/4) = 1;

x = repmat(x_1, N_per);

fig = figure('Position', [200 100 1000 600]);

subplot(2,2,[1 2])
plot(t,x,'LineWidth',1.5)
ylim([-0.2 1.2])
grid on
title('Señal temporal')
xlabel('Tiempo [s]')
ylabel('Amplitud [V]')

k = 0:50;
Ck = 0.5/T*sinc(0.5/T*k).*exp(-1j*2*pi*k/T);
subplot(2,2,3)
stem(k,abs(Ck),'.','MarkerSize',13)
title('Módulo de los coeficientes de la serie de Fourier')
xlabel('k')
ylabel('|Ck|')

subplot(2,2,4)
a = abs(Ck) < 1e-5;
fase = angle(Ck);
fase(a) = NaN;
stem(k,fase,'.','MarkerSize',13)
title('Fase de los coeficientes de la serie de Fourier')
xlabel('k')
ylabel('arg(Ck)')








