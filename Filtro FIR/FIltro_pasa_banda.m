
%% a)  Especificaciones


fp1 = round(14000*5/7);
fp2 = 1000 + fp1 ;
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



%% b) Filtro Ideal

u = 0:1/1000:2;
filtro = (u<w1).*(0) + (w1<= u).*(1) - (u>=w2).*(1);
figure;
plot(u, filtro,'r','LineWidth',1.5)
title('Respuesta en frecuencia del filtro ideal')
xlabel('w')
ylabel('Amplitud')
grid on;
ylim([-0.5,2]);



%% Primer Estimacion del orden del filtro

wt = 2*pi*(fr2 - fp2)/Fs;
ro = 2;
M = ceil(2*pi*ro/wt - 1/2) + 35;


disp(['Oden del filtro: ' num2str(2*M)])

%% c)  Respuesta impulsiva ideal 

n = 0:2*M;
Aw = (w2 - w1);

hi = Aw/pi.*cos(wc*n).*sinc(Aw/(2*pi)*(n-M));       

figure;
stem(n,hi,'.','MarkerSize',10)
grid on
title('Respuesta impulsiva ideal del filtro')
xlabel('Numero de muestra')
ylabel('Amplitud')



%% d)  Ventaneo

w = hamming(2*M+1);                
h = hi.*w';                    


%% e)  Nueva estimacion del orden utilizando la ventana

M1 = ceil((8*pi)/(2*wt) - 1/2)

Orden1 = 2*M1


%% f) Grafico de la respuesta imulsiva con el ventaneo

figure('Position', [200 200 900 400]);
subplot(1,2,1)
stem(n,w,'.','MarkerSize',10)
ylim([0 1.5])
grid on
title('Ventana utilizada: Hamming')

subplot(1,2,2)
stem(n,hi,'.','MarkerSize',10)
hold on
stem(n,h,'.','MarkerSize',10)
title('Respuesta impulsiva del filtro')
legend('Ideal', 'Ventaneada')
grid on



%% g)  Respuesta en frecuencia

[H,w] = freqz(h,1,4096,'whole');
H_dB  = 20*log10(abs(H));
f     = w/(2*pi)*Fs;

figure;
index = f < 20e3;
plot(f(index), H_dB(index),'r','LineWidth',1.5)
title('Respuesta en frecuencia del filtro')
ylabel('Ganancia [dB]')
xlabel('Frecuencia [Hz]')
grid on
hold on


