%% Ejercicio 1 

%Cargo el archivo
load Senal05.mat   

% a)

n = 0:127;
k = ((0:127)/128)*2;    %Normalizo el k para que vaya de 0 a 2; con k = 1 -> w = pi  y  k = 2 -> w = 2*pi
xk = fft(x1);
X1k =  20*log10(abs(xk));%Paso a dB
X1k = X1k - max(X1k);   %Normalizo la amplitud maxima en dB a cero

subplot(2,1,1);
plot(k,X1k);
title('Espectro de x1[n]');
xlabel('k');
ylabel('X1[k]');

subplot(2,1,2);
plot(k,angle(xk));
title('Arg de espectro de x1[n]');
xlabel('k');
ylabel('arg(X1[k])');


%% b)

%Utilizo la ventana de hanning devido a que el lobulo principal no es tan
%ancho, por lo que me permite distinguir las frecuencias w2 y w3. Por
%otro las bandas laterales de la respuesta en frecuencia de la ventana
%decrecen con una pendiente grande, por lo que nos permite ver con mayor
%claridad la frecuencia w1 que se encuentra mas alejada.

w = hanning(128);                
x1v = x1.*w';


figure('Position', [200 200 900 400]);
subplot(1,2,1);
stem(n,w,'.','MarkerSize',10);
ylim([0 1.5]);
xlim([0 128])
grid on;
title('Ventana utilizada: Von Hann')

subplot(1,2,2);
stem(n,x1,'.','MarkerSize',10);
hold on;
stem(n,x1v,'.','MarkerSize',10);
title('Ventaneo');
legend('x1[n]', 'x1v[n]');
xlim([0 128])
grid on;

xk = fft(x1v);
X1vk =  20*log10(abs(xk));
X1vk = X1vk - max(X1vk); 
figure;
subplot(2,1,1);
plot(k, X1vk);
title('Espectro de x1[n]')
xlabel('k')
ylabel('abs(X1[k])')
grid on;

subplot(2,1,2);
plot(k,angle(xk));
title('Arg de espectro de x1[n]');
xlabel('k');
ylabel('arg(X1[k])');
grid on;


%% c)

n = 0:1023;

k = ((0:1023)/1024)*2;
xk = fft(x2);
X2k =  20*log10(abs(xk));
X2k = X2k - max(X2k);

subplot(2,1,1);
plot(k, X2k);
title('Espectro de x2[n]')
xlabel('k')
ylabel('abs(X2[k])')
grid on;

subplot(2,1,2);
plot(k, angle(xk))
title('Arg de espectro de x2[n]')
xlabel('k')
ylabel('arg(X2[k])')
grid on;

%%
% d)

w = hanning(1024);   
%Aplico la ventana a la senial 
x2v = x2.*w';   

figure('Position', [200 200 900 400]);
subplot(1,2,1)
stem(n,w,'.','MarkerSize',10)
ylim([0 1.5])
xlim([0 1024])
grid on
title('Ventana utilizada: von Hann')

subplot(1,2,2)
stem(n,x2,'.','MarkerSize',10)
hold on
stem(n,x2v,'.','MarkerSize',10)
title('Ventaneo')
legend('X2[k]', 'X2v[k]')
xlim([0 1024])
grid on
xk = fft(x2v);
X2vk = 20*log10(abs(xk));
X2vk = X2vk - max(X2vk);     %

figure;
subplot(2,1,1);
plot(k, X2vk);
title('Espectro de x2v[n]')
xlabel('k')
ylabel('abs(X2v[k])')
grid on;
subplot(2,1,2);
plot(k, angle(xk))
title('Arg de espectro de x2v[n]')
xlabel('k')
ylabel('arg(X2v[k])')
grid on;

%% e)


kz = ((0:8191)/8192)*2;
x2z = [x2 zeros(1,7168)];   %Aplico los ceros
xk = fft(x2z);
X2zk = 20*log10(abs(xk));
X2zk = X2zk - max(X2zk);   
figure;
subplot(2,1,1);
plot(kz, X2zk);
title('Espectro de x2z[n]')
xlabel('k')
ylabel('abs(X2z[k])')
grid on;

subplot(2,1,2);
plot(kz, angle(xk));
title('Arg de espectro de x2z[n]');
xlabel('k');
ylabel('arg(X2z[k])');
grid on;







%% f)
nz = 0:8191;
w = hanning(1024);  
x2v = x2.*w';  
% Aplico la ventana antes de aplicar los ceros, ya que si 
%hariamos al revez, estariamos ventaneando un monton de ceros y 
%un poco de la senial con una parte de la ventana.


x2zv = [x2v zeros(1,7168)];     
xk = fft(x2zv);
X2zvk = 20*log10(abs(xk));
X2zvk = X2zvk - max(X2zvk);


figure;
subplot(2,1,1);
plot(kz, X2zvk);
title('Espectro de x2zv[n]')
xlabel('k')
ylabel('abs(X2zv[k])')
grid on;
subplot(2,1,2);
plot(kz, unwrap(angle(xk)));
title('Arg de espectro de x2zv[n]')
xlabel('k')
ylabel('arg(X2zv[k])')
grid on;

%Ploteo del ventaneo


 
figure('Position', [200 200 900 400]);
subplot(1,2,1)
stem(n,w,'.','MarkerSize',10)
ylim([0 1.5])
xlim([0 1024])
grid on
title('Ventana utilizada: von Hann')

subplot(1,2,2)
stem(n,x2,'.','MarkerSize',10)
hold on
stem(nz,x2zv,'.','MarkerSize',10)
title('Ventaneo')
legend('X2[k]', 'X2v[k]')
xlim([0 8191]);
grid on
 

%% % g) Obtencion de las amplitudes, las frecuencias, y las fases

%Aumento le agrego 17168 ceros para obetener asi una mayor definicion en la
%transformada y poder localizar con mayor exactitud los valores de los
%picos

Np = 18192;
k1 = 0:(Np-1);
w = hanning(1024);  
x2v = x2.*w';
x2zv = [x2v zeros(1,17168)]; %Agrego los ceros
xk = fft(x2zv);
X2zvk = 20*log10(abs(xk));
X2zvk = X2zvk - max(X2zvk);

figure;
subplot(2,1,1);
plot(k1, X2zvk);
title('Espectro de x2zv[n]');
xlabel('k');
ylabel('abs(X2zv[k])');
grid on;

%Obtengo "a mano" los valores de K para cada uno de los e picos.
indices = [1681 6725 6907];

GC = (1/Np)*sum(w); %Calculo la ganancia coherente de la ventana, siendo w la ventana de hanning

A = abs(xk(indices))*(2/Np)*(1/GC); %Calculo la amplitud teniendo en cuenta la ganancia de la ventana


phi = unwrap(angle(xk(indices))); %Obtengo los valores de fase

omega = 2*pi*(indices)/18192; %Obtengo los valores de frecuencia

w1 = omega(1);
w2 = omega(2);
w3 = omega(3);

phi1 = phi(1);
phi2 = phi(2);
phi3 = phi(3);

A1 = A(1) ;
A2 = A(2);
A3 = A(3);

%% Reconstruccion de la senial 

close all
n = 0:1023;

Xn = A1*cos(w1*n + phi1) + A2*cos(w2*n + phi2) + A3*cos(w3*n + phi3); 

subplot(2,1,1);
plot(n,Xn,'r');
hold on;    
plot(n,x2, 'b')
title('Recontruccion');
xlabel('n');
ylabel('x[n])');
xlim([0 1023])
grid on;
subplot(2,1,2);
dif = Xn - x2;
plot(n,dif)
title('Diferencia');
xlabel('n');
xlim([0 1023])

% Podemos ver que el error es muy bajo, del orden de los 0.6

