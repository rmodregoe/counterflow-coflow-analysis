%Chorro coflujo

%Diferencias finitas


xf=0.5;
dx=0.00001;
x=0:dx:xf-dx;
Nx=xf/dx;

rf=1.1;
dr=0.01;
r=0:dr:rf;
Nr=rf/dr;

z=zeros(length(x),length(r));
cond_iniciales_1 = find(r<1);
cond_iniciales_2 = find(r>=1);

z(1,find(r<1)) = 1;
z(1,find(r>=1)) = 0;


for n=1:Nx-1

    
    for i=2:Nr-1
        
        z(n+1,i) = z(n,i) + dx/dr*((1/r(i))*(z(n,i+1)-z(n,i)) + (1/dr)*(z(n,i+1) - 2*z(n,i) + z(n,i-1)));    
        
    end
    z(n+1,1) = z(n+1,2);
    z(n+1,end)=z(n+1,end-1);
    
end

v=[0.2, 0.2];
M=contour(x,r,z',v);
contour(x,r,z',v,'r')


% Longitud de la llama 
max(M(:,2))