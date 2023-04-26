T0 = 1/100;

%---- Ejercicio 1 ----%

%-a)-%
%{
f = -2000:2000;

X_f = 1j*(T0/4).*((sinc((T0/2)*(f + 5/T0))).^2 - (sinc((T0/2)*(f-5/T0))).^2);

subplot(2,1,1)
plot(f,abs(X_f));
title('Funcion |X(f)|');
xlabel('f');
ylabel('Abs X(f)');

subplot(2,1,2)
plot(f,imag(X_f));
title('Funcion Im X(f)');
xlabel('f');
ylabel('Imag X(f)');
%}

%-b)-%
%{
k = -10:10;

C_k = (1j/4)*(sinc(k/2+ 5/2).^2 - sinc(k/2 - 5/2).^2);

subplot(2,1,1)
stem(k/T0,abs(C_k));
xlabel('f');
ylabel('Abs Y(f)');

subplot(2,1,2)
stem(k/T0,imag(C_k));
xlabel('f');
ylabel('Imag Y(f)');
%}

%-c)-%

k = -10:10;

C_k = (1j/4)*(sinc(k/2+ 5/2).^2 - sinc(k/2 - 5/2).^2).*exp(-1j*2*pi*(k/2));

subplot(2,1,1)
stem(k/T0,abs(C_k));
xlabel('f');
ylabel('Abs Z(f)');

subplot(2,1,2)
stem(k/T0,imag(C_k));
xlabel('f');
ylabel('Imag Z(f)');


%---- Ejercicio 2 ----%

%-a)-%
%{
A = 1;
tao=1
f0 = 10000;
t = -4:1/102:4;
Xm_t= A.*((sinc(t/tao)).^2).*cos(2*pi*f0*t);

subplot(1,1,1)
plot(t,Xm_t);
xlabel('f');
ylabel('Abs Y(f)');
%}



%{
X1 = A*(tao^2)*(f-f0)+A*tao;
X2 = -A*(tao^2)*(f-f0)+A*tao;
X3 = A*(tao^2)*(f+f0)+A*tao;
X4 = -A*(tao^2)*(f+f0)+A*tao;

A = 1;
tao=1
f0 = 1000;
f = -1000:1000;
Xm_f = piecewise(-1/tao+f0<f<f0,X1,f0<f<(1/tao)+f0,X2,-1/tao-f0<f<-f0, X3,-f0<f<(1/tao)-f0,X4)


%}

