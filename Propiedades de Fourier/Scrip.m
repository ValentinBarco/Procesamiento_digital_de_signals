syms f t T0 a b

a = limit((a/(2*pi*f))*sinc(t*f)*sin(2*pi*f*(T0+t)/2) + b/(2*pi*f)*sin(2*pi*f*(T0/2)),f,0)


b= limit((1/(2*pi*f))*(sinc(t*f)*cos(2*pi*f*(T0+t)/2)+ b*cos(2*pi*f*(T0/2)))+(a-b)*sinc(T0*f),f,0)