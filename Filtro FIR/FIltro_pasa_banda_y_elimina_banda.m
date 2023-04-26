%% Especificaciones

fp1 = round(14000*5/7);
fp2 = 1000 + fp1;
fr1 = 9500;
fr2 = 11500;
Ancho_banda_de_paso = 1000;
Ancho_banda_de_rechazo = 1000;
Atmax_paso = 1;
Fs = 48000;


%% Algunas cuentas

wp1 = 2*pi*fp1/Fs;
wp2 = 2*pi*fp2/Fs;
wr1 = 2*pi*fr1/Fs;
wr2 = 2*pi*fr2/Fs;

w1 = (wr1 + wp1)/2;
w2 = (wr2 + wp2)/2;


fc = (fp1 + fp2)/2

wc = 2*pi*fc/Fs

%% Estimacion del orden del filtro

wt = 2*pi*(fr2 - fp2)/Fs;
ro = 2;
M = ceil(2*pi*ro/wt - 1/2);

disp(['Oden del filtro: ' num2str(2*M + 1)])


%% Respuesta impulsiva ideal 

n = 0:2*M;
Aw = (w2 - w1);

hi = Aw/pi.*cos(wc*n).*sinc(Aw/(2*pi)*(n-M));       

figure;
stem(n,hi,'.','MarkerSize',10)
grid on
title('Respuesta impulsiva ideal del filtro')
xlabel('Numero de muestra')
ylabel('Amplitud')



%% Ventaneo

w = hamming(2*M+1);                
h = hi.*w';                    


                                   
figure('Position', [200 200 900 400]);
subplot(1,2,1)
stem(n,w,'.','MarkerSize',10)
ylim([0 1.5])
grid on
title('Ventana utilizada: Hamming')

subplot(1,2,2)
stem(n,hi,'.','MarkerSize',10)
hold on
title('Respuesta impulsiva del filtro')
legend('Ideal', 'Ventaneada')
grid on

stem(n,h,'.','MarkerSize',10)
title('Respuesta impulsiva del filtro')
legend('Ideal', 'Ventaneada')
grid on



%% Respuesta en frecuencia


[H,w] = freqz(h,1,4096,'whole');
H_dB  = 20*log10(abs(H));
s = abs(H)
f     = w/(2*pi)*Fs;

figure;
index = f < 20e3;
plot(f(index), s(index),'r','LineWidth',1.5)
title('Respuesta en frecuencia del filtro')
ylabel('Ganancia [dB]')
xlabel('Frecuencia [Hz]')
grid on
hold on
%{
max_aten_dB = -1;
plot([0 fp1],[max_aten_dB max_aten_dB],'k--',...
    [0 fp1],[-max_aten_dB -max_aten_dB],'k--')
hold on
plot([0 fp2],[max_aten_dB max_aten_dB],'k--',...
    [0 fp2],[-max_aten_dB -max_aten_dB],'k--')


lim = xlim;
min_aten_dB = -60;
plot([fr1 lim(2)],[min_aten_dB min_aten_dB],'k--')
hold on
plot([fr2 lim(2)],[min_aten_dB min_aten_dB],'k--')
lim = ylim;
ylim([lim(1) 10])
title('Modulo de la respuesta en frecuencia del filtro')
ylabel('Ganancia [dB]')
xlabel('Frecuencia [Hz]')
legend('Respuesta en frecuencia', 'Especificaciones')
grid on

%}

