
%Apartado 7)
%Representar Z, Yf/Yf0, Yo2/Yo2A, T/T0 en función de eta en la misma gráfica

%Datos

Q=241845;
Yf0=0.5;
Cp=35.988;
T0=298;

Zs = 1/(1+8*0.5/0.23);
ad=Q*Yf0*Zs/(2*28*Cp*T0);
z = @(x) 1/2*(-erf(x/sqrt(2))+1);
etaf=2*erfinv(1-2*Zs);
xf=etaf/sqrt(2);
%Expresiones para Z<Zs (1) y Z>Zs

yF1= @(x) 0*x;
yF2= @(x) (z(x)-Zs)/(1-Zs);

yO21= @(x) (Zs-z(x))/Zs;
yO22= @(x) 0*x;


T1= @(x) 1+ad*z(x);
T2= @(x) 1+ad*Zs*(1-z(x))/(1-Zs);


x1= -5:0.01:xf;
x2= xf:0.01:5;
x = -5:0.01:5;

eta1=-5:0.01:etaf;
eta2=etaf:0.01:5;
eta=-5:0.01:5;

plot(x,z(x))
hold on
plot(x2,yO21(x2))
plot(x1,yO22(x1))

plot(x2,yF1(x2))
plot(x1,yF2(x1))

plot(x2,T1(x2))
plot(x1,T2(x1))

legend('Z','yO21/yO2A','yF1/yF0','T1/T0','yO22/yO2A','yF2/yF0','T2/T0')
title('Variables en función de x')

hold off


