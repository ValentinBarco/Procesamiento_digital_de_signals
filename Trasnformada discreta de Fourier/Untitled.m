%% Especificaciones

fp1 = round(14000*5/7);
fp2 = 1000 + fp1;
fr1 = 9500;
fr2 = 11500;
Ancho_banda_de_paso = 1000;
Ancho_banda_de_rechazo = 1000;
Atmax = 0;
Fs = 48000;


%% Algunas cuentas

wp1 = 2*pi*fp1/Fs;
wp2 = 2*pi*fp2/Fs;
wr1 = 2*pi*fr1/Fs;
wr2 = 2*pi*fr2/Fs;

w1 = (wr1 + wp1)/2;
w2 = (wr2 + wp2)/2;

%% Estimacion del orden del filtro

wt = 2*pi*(fr2 - fp2)/Fs;
ro = 2;
M = ceil(2*pi*ro/wt - 1/2);

disp(['Oden del filtro: ' num2str(2*M + 1)])


%% Respuesta impulsiva ideal 

n = 0:2*M;
wc = (w2 - w1);

hi = wc/pi*sinc(wc/pi*(n-M));       

figure;
stem(n,hi,'.','MarkerSize',10)
grid on
title('Respuesta impulsiva ideal del filtro')
xlabel('Numero de muestra')
ylabel('Amplitud')





