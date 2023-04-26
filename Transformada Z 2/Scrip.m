w = -pi:1/100:pi;
%w = pi*5/4;
x1 = abs(1.*exp(1j.*w)- (sqrt(2)/8))

x2 = abs(1.*exp(1j*w) - (1/4).*exp(1j*pi/4)).*abs(1.*exp(1j*w) - (1/4).*exp(-1j*pi/4))

x3 = x1./x2

    
plot(w,x3);
xlim([-pi,pi]);
xlabel('w');
ylabel('Abs(H(e^j^w))');

z =  (1/4)*exp(-1j*pi/4);

%z = 1/4;

a1 = 1 - (sqrt(2)/8)/z;

a2 = 1 - (1/4) * exp(-1j*pi/4)/z;

a3 = 1 - (1/4) * exp(1j*pi/4)/z;

a4 = 1 - 1/(4*z);

 
aaa = a1/(a3*a4);