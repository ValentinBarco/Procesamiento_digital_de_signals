
%% Ejercicio 1

% a) 

%{
N = 4;
k = 0:N-1;
Xk1 = [4,-5,3,-5]
subplot(4,1,1);
stem(k,abs(Xk1));
title('X[k]');
ylabel('abs(X[k])');
xlabel('k');
grid on;

subplot(4,1,2);
stem(k,angle(Xk1));
ylabel('arg(X[k])');
xlabel('k');
xlabel('k');
grid on;

n = 0:N-1;
Xn1 = ifft(Xk1);
subplot(4,1,3);
stem(n,abs(Xn1));
title('Antitransformada de X[k]');
ylabel('abs(x[n])');
xlabel('n');
xlabel('k');
grid on;

subplot(4,1,4);
stem(n,angle(Xn1));
ylabel('arg(x[n])');
xlabel('n');
xlabel('k');
grid on;
%}

% b)

%{
N = 5;
k = 0:N-1;
Xk1 = [4,-5,3,-5,0]
subplot(4,1,1);
stem(k,abs(Xk1));
title('X[k]');
ylabel('abs(X[k])');
xlabel('k');
grid on;

subplot(4,1,2);
stem(k,angle(Xk1));
ylabel('arg(X[k])');
xlabel('k');
xlabel('k');
grid on;

n = 0:N-1;
Xn1 = ifft(Xk1);
subplot(4,1,3);
stem(n,abs(Xn1));
title('Antitransformada de X[k]');
ylabel('abs(x[n])');
xlabel('n');
xlabel('k');
grid on;

subplot(4,1,4);
stem(n,angle(Xn1));
ylabel('arg(x[n])');
xlabel('n');
xlabel('k');
grid on;
%}

% c)
%{
N = 4;
k = 0:N-1;
Xk1 = [5,-2j,3,-2j];
subplot(4,1,1);
stem(k,abs(Xk1));
title('X[k]');
ylabel('abs(X[k])');
xlabel('k');
grid on;

subplot(4,1,2);
stem(k,angle(Xk1));
ylabel('arg(X[k])');
xlabel('k');
xlabel('k');
grid on;

n = 0:N-1;
Xn1 = ifft(Xk1);
subplot(4,1,3);
stem(n,abs(Xn1));
title('Antitransformada de X[k]');
ylabel('abs(x[n])');
xlabel('n');
xlabel('k');
grid on;

subplot(4,1,4);
stem(n,angle(Xn1));
ylabel('arg(x[n])');
xlabel('n');
xlabel('k');
grid on;
%}

% d)

N = 4;
n = 0:N-1;
Xn1 = [2,0,0,2];
subplot(4,1,1);
stem(n,abs(Xn1));
title('X[n]');
ylabel('abs(X[n])');
xlabel('n');
grid on;

subplot(4,1,2);
stem(n,angle(Xn1));
ylabel('arg(X[n])');
xlabel('n');

grid on;

k = 0:N-1;
Xk1 = fft(Xn1);
subplot(4,1,3);
stem(n,abs(Xk1));
title('Serie de fourier de X[n]');
ylabel('abs(x[k])');
xlabel('k');
grid on;

subplot(4,1,4);
stem(n,angle(Xn1));
ylabel('arg(x[k])');
xlabel('k');
grid on;


% e)
%{
N = 4;
n = 0:N-1;
Xn1 = [1,1,1,1];
subplot(4,1,1);
stem(n,abs(Xn1));
title('X[n]');
ylabel('abs(X[n])');
xlabel('n');
grid on;

subplot(4,1,2);
stem(n,angle(Xn1));
ylabel('arg(X[k])');
xlabel('n');

grid on;

k = 0:N-1;
Xk1 = fft(Xn1);
subplot(4,1,3);
stem(k,abs(Xk1));
title('Serie de fourier de X[n]');
ylabel('abs(x[k])');
xlabel('k');
grid on;

subplot(4,1,4);
stem(n,angle(Xn1));
ylabel('arg(x[k])');
xlabel('k');
grid on;
%}


%% Ejercicio 2

% a)

%{
wa = 0:1/100:2*pi;

a = 1 + exp(-1j* wa) + exp(-1j*2*wa) + exp(-1j*3*wa);
subplot(2,1,1);
plot(wa,abs(a));
title('Modulo de transformada de x[n]');
ylabel('abs(X(ejw))');
xlabel('w');
xlim([0,2*pi]);
subplot(2,1,2)
plot(wa,unwrap(angle(a)));
title('Angulo de transformada de x[n]');
ylabel('Arg(X(ejw))');
xlabel('w');
xlim([0,2*pi]);

%}
% b) y c)

%{
N = 8;
k= -10:10;
Xk1 = 1 + exp(-1*j*(2*pi*k)/N) + exp(-1*j*(4*pi*k)/N) + exp(-1*j*(6*pi*k)/N); 
subplot(2,1,1);
grid on;
stem(k,abs(Xk1));
ylabel('abs(X(periodica)[k])');
xlabel('k');

subplot(2,1,2);
stem(k,angle(Xk1));
ylabel('abs(X(periodica)[k])');
xlabel('k');
grid on;
%}

% d)

%{
N = 4;
k= -10:10;
Xk1 = 1 + exp(-1*j*(2*pi*k)/N) + exp(-1*j*(4*pi*k)/N) + exp(-1*j*(6*pi*k)/N); 
subplot(2,1,1);
grid on;
stem(k,abs(Xk1));
ylabel('abs(X(periodica)[k])');
xlabel('k');

subplot(2,1,2);
stem(k,angle(real(Xk1)));
ylabel('arg(X(periodica)[k])');
xlabel('k');
grid on;
%}

% e)
%{
N = 4;

k= 0:N-1;
Xk1 = 1 + exp(-1*j*(2*pi*k)/N) + exp(-1*j*(4*pi*k)/N) + exp(-1*j*(6*pi*k)/N); 
subplot(2,1,1);
grid on;
stem(k,abs(Xk1));
ylabel('abs(X[k])');
xlabel('k');

subplot(2,1,2);
stem(k,angle(real(Xk1)));
ylabel('arg(X[k])');
xlabel('k');
grid on;
%}


%% Ejercicio 4


%{
w1 = 0:1/500:2*pi;

Xw = 1./(1 - (1/2).*exp(-1j*w1));

subplot(3,1,1);
plot(w1,real(Xw));

title('Transformada de Fourier de tiempo discreto');
ylabel('X(ejw)');
xlabel('w');
grid on;

k = 0:3;

Xk = 1./(1 - (1/2).*exp(-1j*(2*pi*k/4)));
subplot(3,1,2);
stem(k,real(Xk));

title('Transformada discreta de Fourier');
ylabel('X[k]');
xlabel('k');
grid on;
n = 0:3;
xpico = ifft(Xk);

subplot(3,1,3);
stem(n,xpico);
title('Antitransformada de X[k]');
ylabel('X"[n]');
xlabel('n');
grid on;
%}






