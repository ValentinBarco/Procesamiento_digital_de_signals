%% a) Especificaciones
fc1 = 4000 - 130;
fc2 = 7000 + 130;
fr1 = fc1 + 500;
fr2 = fc2 - 500;
Atmax_paso = 1;
Fs = 48000;
%% Algunas cuentas

wc1 = 2*pi*fc1/Fs;
wc2 = 2*pi*fc2/Fs; 
wr1 = 2*pi*fr1/Fs;
wr2 = 2*pi*fr2/Fs;
fc = (fc1 + fc2)/2;
wc = 2*pi*fc/Fs;

w1 = (wc1 + wr1)/2;
w2 = (wc2 + wr2)/2;
%% Estimacion del orden del filtro
wt = 2*pi*(fr1 - fc1)/Fs;
ro = 2;
M = ceil(2*pi*ro/wt - 1/2);
M= 210;
disp(['Oden del filtro: ' num2str(2*M + 1)])


%% b) Filtro Ideal

u = 0:1/1000:2;
filtro = 1 - ((u<w1).*(0) + (w1<= u).*(1) - (u>=w2).*(1));
figure;
plot(u, filtro,'r','LineWidth',1.5)
title('Respuesta en frecuencia del filtro ideal')
xlabel('Frecuencia [Hz]')
ylabel('Amplitud')
ylim([-0.5,2]);
grid on

%% c)  Respuesta impulsiva ideal 
n = 0:2*M;
hi =  -w2/(pi)*sinc(w2/pi*(n-M))+ w1/(pi)*sinc(w1/pi*(n-M));     
hi(M+1) = 1 + hi(M+1);

figure;
stem(n,hi,'.','MarkerSize',10)
grid on
title('Respuesta impulsiva ideal del filtro')
xlabel('Numero de muestra')
ylabel('Amplitud')

%% d)  Ventaneo

w = hanning(2*M+1);                
h = hi.*w';                    
          

%% e)  Nueva estimacion del orden utilizando la ventana

M1 = ceil((8*pi)/(2*wt) - 1/2)



%% f) Grafico de la respuesta imulsiva con el ventaneo

figure('Position', [200 200 900 400]);
subplot(1,2,1)
stem(n,w,'.','MarkerSize',10)
ylim([0 1.5])
grid on
title('Ventana utilizada: von Hann')

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
