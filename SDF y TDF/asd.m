N = 4
k= 0:10;
Xk1 = 1 + exp(-1*j*(2*pi*k)/N) + exp(-1*j*(4*pi*k)/N) + exp(-1*j*(6*pi*k)/N) 
subplot(2,1,1);
grid on;
title('')
ylabel('X(ejw)')
xlabel('w')
stem(k,abs(Xk1));
subplot(2,1,2);
grid on;
stem(k,angle(Xk1));
