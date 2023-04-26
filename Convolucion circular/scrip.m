
%% Ejercicio 1

% a)


n=0:3;
N = 4;
X1 = mod(-n,N);
subplot(3,1,1);
stem(n,X1);

Xn = [6,5,4,3];
subplot(3,1,2);
stem(n,Xn);

subplot(3,1,3);
stem(X1,Xn);


% b)

%{
n=0:3;
N = 4;
X1 = mod(n-2,N);
subplot(3,1,1);
stem(n,X1);

Xn = [6,5,4,3];
subplot(3,1,2);
stem(n,Xn);

subplot(3,1,3);
stem(X1,Xn);

%}


%% Ejercicio 2 

% d)


x1a = [6,5,4,3,2,1];
x2a = [1,0,0,0,1,0];
n6 = 0:5;
k6 = 0:5;
x2aN = mod(-n6,6);

X1ak = fft(x1a);
X2ak = fft(x2a);

%{
subplot(2,1,1);
stem(k6,X1ak);
ylabel('X1a[k]');
xlabel('k');
grid on;

subplot(2,1,2);
stem(k6,X2ak);
ylabel('X2a[k]');
xlabel('k');
grid on;
%}

% e)

x1b = [6,5,4,3,2,1,0,0,0,0];
x2b = [1,0,0,0,1,0,0,0,0,0];
n10 = 0:9;
k10 = 0:9;
x2N = mod(-n10,10);

X1bk = fft(x1b);
X2bk = fft(x2b);

%{
subplot(2,1,1);
stem(k10,X1bk);
ylabel('X1b[k]');
xlabel('k');
grid on;

subplot(2,1,2);
stem(k10,X2bk);
ylabel('X2b[k]');
xlabel('k');
grid on;
%}

% f)

Yak = X1ak.*X2ak;
Ybk = X1bk.*X2bk;

%{
subplot(2,1,1);
stem(k6,Yak);
ylabel('Ya[k]');
xlabel('k');
grid on;

subplot(2,1,2);
stem(k10,Ybk);
ylabel('Yb[k]');
xlabel('k');
grid on;
%}

% g)

yan = ifft(Yak);
ybn = ifft(Ybk);

%{
subplot(2,1,1);
stem(k6,yan);
ylabel('ya[n]');
xlabel('n');
grid on;

subplot(2,1,2);
stem(k10,ybn);
ylabel('yb[n]');
xlabel('n');
grid on;
%}










