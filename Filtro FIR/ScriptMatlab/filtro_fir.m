% Diseño de filtro FIR pasabajos utilizando ventanas
close all
clear all
%% Especificaciones
f_banda_paso = 2e3;
f_banda_rechazo = 3e3;
f_muestreo = 200e3;
max_aten = 0.99;
min_aten = 1/100;

%% Estimaci�n del orden del filtro
fc1 = f_banda_paso;                 % la frecuencia esquina de la banda de paso
fc2 = f_banda_rechazo;              % la frecuencia esquina de la banda de rechazo
fc = (fc1+fc2)/2;                   % la frecuencia de corte del filtro ideal
wc = 2*pi*fc/f_muestreo;            % frec. corte del filtro ideal en discreto
wt = 2*pi*(fc2 - fc1)/f_muestreo;   % el ancho de la banda de transición ()en frec. discretas)
ro = 2;                             % cuánto es más ancho el lobulo de la ventana elegia respecto a la rectangular
M = ceil(2*pi*ro/wt - 1/2);         % esimación del orden del filtro

disp(['Orden del filtro: ' num2str(2*M+1)])

%% Respuesta impulsiva ideal

n = 0:2*M;                          % vector de tiempos
hi = wc/pi*sinc(wc/pi*(n-M));       % el filtro ideal causalizado


% dibuja la respuesta impulriva del filtro ideal
figure;
stem(n,hi,'.','MarkerSize',10)
grid on
title('Respuesta impulsiva ideal del filtro')
xlabel('Número de muestra')
ylabel('Amplitud')

%% Ventaneo
w = hamming(2*M+1)';                % ventana de hamming (por eso ro=2 arriba)
h = hi.*w;                          % en matlab las ventana las devuelve como vector 
                                    % columna, por eso el transpuesto
                                    % arriba

%% grafica la venanta, y la respuesta impulsiva ideal y la ventaneadoa
figure('Position', [200 200 900 400]);
subplot(1,2,1)
stem(n,w,'.','MarkerSize',10)
ylim([0 1.5])
grid on
title('Ventana utilizada')

subplot(1,2,2)
stem(n,hi,'.','MarkerSize',10)
hold on
stem(n,h,'.','MarkerSize',10)
title('Respuesta impulsiva del filtro')
legend('Ideal', 'Ventaneada')
grid on

%% Análisis de la respuesta en frecuencia obtenida
% f = fvtool(h);                      % una opcion cómoda
% f.Fs = f_muestreo;

% esta opcion usa freqz y dibuja las especificaciones
[H,w] = freqz(h,1,4096,'whole');
H_dB  = 20*log10(abs(H));
f     = w/(2*pi)*f_muestreo;

% grafica la respuesta en frecuencia y las espeicificaciones
figure;
index = f < 20e3;
plot(f(index), H_dB(index),'r','LineWidth',1.5)
grid on
hold on
max_aten_dB = abs(20*log10(max_aten));
plot([0 f_banda_paso],[max_aten_dB max_aten_dB],'k--',...
    [0 f_banda_paso],[-max_aten_dB -max_aten_dB],'k--')
lim = xlim;
min_aten_dB = 20*log10(min_aten);
plot([f_banda_rechazo lim(2)],[min_aten_dB min_aten_dB],'k--')
lim = ylim;
ylim([lim(1) 10])
title('Modulo de la respuesta en frecuencia del filtro')
ylabel('Ganancia [dB]')
xlabel('Frecuencia [Hz]')
legend('Respuesta en frecuencia', 'Especificaciones')
grid on

%% Simulacion de una medicion real
% esto puede tardar muuuuuucho (y por ahi necesita una version nueva del
% simulink)
sim('circuito.slx')

figure('Position', [200 200 900 400]);
subplot(1,2,1)
plot(t, i_in)
title('Corriente de entrada')
xlabel('Tiempo [s]')
ylabel('Corriente [A]')
grid on

subplot(1,2,2)
plot(t, v_out)
title('Tension de salida')
xlabel('Tiempo [s]')
ylabel('Tension [V]')
grid on

%% Analisis del espectro con y sin filtro
log_scale = true;

figure('Position', [200 200 900 400]);

i_in_filt = filter(h,1,i_in);

subplot(1,2,1)
plot(t, i_in, t, i_in_filt)
title('Corriente de entrada')
xlabel('Tiempo [s]')
ylabel('Corriente [A]')
legend('Original', 'Filtrada')
grid on

subplot(1,2,2)
if log_scale
    I_in = 20*log10(abs(fft(i_in)/length(i_in)));
    I_in = I_in(1:round(length(I_in)/2));
    plot(I_in)
    hold on
    I_in = 20*log10(abs(fft(i_in_filt)/length(i_in_filt)));
    I_in = I_in(1:round(length(I_in)/2));
    plot(I_in)
    ylabel('Corriente [dBA]')
    ylim([-100 0])
else
    I_in = abs(fft(i_in)/length(i_in));
    I_in = I_in(1:round(length(I_in)/2));
    plot(I_in)
    hold on
    I_in = abs(fft(i_in_filt)/length(i_in_filt));
    I_in = I_in(1:round(length(I_in)/2));
    plot(I_in)
    ylabel('Corriente [A]')
    ylim([0 0.4])
end

xlim([0 10000])
title('Espectro de la corriente de entrada')
xlabel('Frecuencia [Hz]')
legend('Original', 'Filtrada')
grid on




