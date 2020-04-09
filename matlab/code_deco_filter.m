%Simulacion tercer parcial

clear all;
close all;
%Eleccion de filtro wavelet

typeofbasis = 'o';  %o -> ortogonal / b -> biortogonal
typbior = 'bior2.2';
typor = 'db2';

if typeofbasis == 'b'
    [Rf,Df] = biorwavf(typbior);
    [h0,h1,g0,g1] = biorfilt(Df,Rf);
elseif typeofbasis == 'o'
    [h0,h1,g0,g1] = wfilters(typor);
end;

h = [h0;h1];
g = [g0;g1];

x=1:10;

% realizar la implementacion por bloque para obtener reconstruccion perfecta
x00 = downsample(conv(x,h0),2,0);
x11 = downsample(conv(x,h1),2,0);

x0r = conv(upsample(x00, 2),g0);
x1r = conv(upsample(x11, 2),g1);

xr = x0r + x1r

%
%Diseño de filtros wavelet
%Para obtener h0,h1,g0,g1

Nr=2;
input_sample=1:20;
lx=length(input_sample);

N=length(h0);
x=zeros(1:N);
xhdu=zeros(Nr,N);
for n=0:lx+N-2
    disp(['n   ',num2str(n)])
    if(n<lx)
        x(1,1)=input_sample(n+1); %buffer de entrada
    else
        x(1,1)=0;
    end;
    disp(['muestras de entrada',num2str(x(1,1))]);
    
    %etapa de analisis
    xh=zeros(Nr,1);
    for kk=1:Nr
        for j=1:N
            xh(kk,1)=xh(kk,1)+h(kk,j)*x(1,j);
        end;
    end;
    for ii=N:-1:2
        x(1,ii)=x(1,ii-1);  %desplazamiento
    end;
    if (mod(n,2)==0)    %diezmado
        xhd(1,1)=xh(1,1);
        xhd(2,1)=xh(2,1);
    end;
    
    %etapa de sintesis
    if mod(n,2)==0
        xhdu(1,1)=xhd(1,1);
        xhdu(2,1)=xhd(2,1);
    else
        xhdu(1,1)=0;
        xhdu(2,1)=0;
    end;
    
    %filtrado de sintesis
    xhduy=zeros(Nr,1);
    for kk=1:Nr
        for j=1:N
            xhduy(kk,1)=xhduy(kk,1)+g(kk,j)*xhdu(kk,j);
        end;
    end;
    
    %corrimiento
    for ii=N-1:-1:1
        xhdu(1,ii+1)=xhdu(1,ii);
        xhdu(2,ii+1)=xhdu(2,ii);
    end;
    xrec(1,1)=xhduy(1,1)+xhduy(2,1);
    xrec
    pause;
end;    %final
