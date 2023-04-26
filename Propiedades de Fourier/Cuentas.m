syms f t T0 a b


%---- Propiedad de Area de Xe(f)----%
a = limit((a/(2*pi*f))*sinc(t*f)*sin(2*pi*f*(T0+t)/2) + b/(2*pi*f)*sin(2*pi*f*(T0/2)),f,0);


%---- Propiedad de Area de Xo(f)----%
b= limit((1/(2*pi*f))*(a*sinc(t*f)*cos(2*pi*f*(T0+t)/2) - b*cos(2*pi*f*(T0/2))-(a-b)*sinc(T0*f)),f,0);