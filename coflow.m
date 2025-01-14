%Chorro coflujo

%Diferencias finitas

%2)
xf=0.5;
dx=0.00001;
x=0:dx:xf-dx;
Nx=xf/dx;

rf=1.1;
dr=0.01;
r=0:dr:rf;
Nr=rf/dr;
%Condiciones iniciales
c1=find(r<1);
c2=find(r>=1);

z=zeros(length(x),length(r));
z(1,c1)=1; %z=1 en r'<1
z(1,c2)=0; %z=0 en r'=1

%i-->x 'tiempo'
%j-->r

for i=1:Nx-1
    
    
    for j=2:Nr-1
    
    
    z(i+1,j)=z(i,j)+dx/dr*((1/r(j))*(z(i,j+1)-z(i,j))+(1/dr)*(z(i,j+1) - 2*z(i,j) + z(i,j-1)));
    
    end
    
    %condiciones de contorno
    z(i+1,1)=z(i+1,2); 
    z(i+1,end)=z(i+1,end-1);
    
  
    
end

 v=[0.2, 0.2]; %posición de la llama
 figure
 contour(x,r,z',v)
 title('Llama Zs=0.2')
 llama=contour(x,r,z',v);
 long=max(llama(:,2)) %longitud de la llama

%4.1)

z3=@(x) 1./x/4; %r=0
plot(x,z(:,find(r==0))) %r=0
hold on
plot(x,z3(x))
hold off
legend('Z2','Z3')
title('X0')
%No podemos hallar x0

%4.2) Tomamos un valor de x0 arbitrario para hacer este apartado
zr=@(x,r) exp(-r.^2./(4*x))./4*x;
x0=0.1;

figure
hold on
plot(z(find(x==0.1),:))
plot(x,z3(x+x0))
hold off
legend('Z2','Z3')
title('X2=0.1')
axis([0 5 0 1])
figure
hold on
plot(z(find(x==0.2),:))
plot(x,z3(x+x0))
hold off
legend('Z2','Z3')
title('X2=0.2')

figure
hold on
plot(z(find(x==0.3),:))
plot(x,z3(x+x0))
hold off
legend('Z2','Z3')
title('X2=0.3')

figure
hold on
plot(z(find(x==0.4),:))
plot(x,z3(x+x0))
hold off
legend('Z2','Z3')
title('X2=0.4')