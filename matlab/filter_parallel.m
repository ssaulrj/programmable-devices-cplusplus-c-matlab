%Filtro con estructura paralela--------------------------------------------
clear all
close all
clc
%Señal a filtrar-----------------------------------------------------------
Fs = 16000;
% n = 0:1/Fs:0.1;
n= 1:10;
f = -Fs/2:Fs/1024:(Fs/2)-(Fs/1024);
% input = sin(2*pi*500*n) + sin(2*pi*750*n) + sin(2*pi*1000*n);
input= 1:10;
%Chevishev Type II - LPF - IIR---------------------------------------------
%   Order:  8
%   Fs:     16000 Hz
%   Fstop:  600 Hz
%   Astop:  50 db

% BB = [0.00281753320009307 -0.0186332623620657 0.0564702461890572 -0.103174030121843 0.125041427898891 -0.103174030121843 0.0564702461890572 -0.0186332623620657 0.00281753320009307];
% AA = [1 -6.98651386148163 21.4132680516544 -37.5991643346928 41.3619378411999 -29.1873755018698 12.9006312896247 -3.26502081818785 0.362239735462358];

BB = [0.701138408271845 -1.14218307447944 2.27823310502802 -1.60314069311031 2.08872815912573 -0.962776467521355 2.08872815912573 -1.60314069311031 2.27823310502802 -1.14218307447944 0.701138408271845];
AA = [1 -1.86372840593322 3.49473803139883 -2.79797462304339 2.92653774648078 -1.18477771451806 1.72120930236619 -0.932373679142904 1.51417133708089 -0.686689679223326 0.491663026684541];

[r,p,k]=residue(BB,AA); 

%Pares Hx(z) , orden 10-----------------------------------------------------
[b1,a1]=residue(r(1:2),p(1:2),k);
[b2,a2]=residue(r(3:4),p(3:4),0);
[b3,a3]=residue(r(5:6),p(5:6),0);
[b4,a4]=residue(r(7:8),p(7:8),0);
[b5,a5]=residue(r(9:10),p(9:10),0);

b1 = real(b1);  b2 = real(b2);  b3 = real(b3);  b4 = real(b4);  b5 = real(b5);
a1 = real(a1);  a2 = real(a2);  a3 = real(a3);  a4 = real(a4);  a5 = real(a5);

b_coef = [b1;0 b2;0 b3;0 b4;0 b5] %Agregar 0s cuando no exista un valor a la izq
a_coef = [a1; a2; a3; a4; a5]

etapas = 5;  %#de etapas= 4 =Orden/2
u = zeros(etapas, 3); 
y_index = 1; %Numera el indice de las muestras de salida
y1 = zeros(1,length(input));

y2 = filter(BB,AA,input);    %filtro por bloques 

%Algoritmo de filtrado-----------------------------------------------------
for n_ = 1:length(input) 
    x = input(n_);
    y = 0;  
    for s = 1:etapas      
        b = b_coef(s,:);
        a = a_coef(s,:);     
        temp1 = 0; temp2 = 0;
        for k=2:3
            temp1 = temp1 - (a(k)*u(s,k));
            temp2 = temp2 + (b(k)*u(s,k));
        end
        u(s,1) = x + temp1;     
        u(s,3) = u(s,2);
        u(s,2) = u(s,1);    
        y_e = (u(s,1)*b(1)) + temp2;      
        y = y + y_e; %Acumulamos en y la salida de las N etapas
    end  
    y
    y2
    pause;
    y1(y_index) = y;
    y_index = y_index +1;
end
%--------------------------------------------------------------------------
y1;  % señal deseada
Y1 = fftshift( fft( y1,length(f) ) );

y3 = 0;
for s = 1:etapas
    b = b_coef(s,:);
    a = a_coef(s,:);
    y3 = y3 + filter(b,a,input);
end
Y = fftshift( fft( y1,length(f) ) );
X = fftshift( fft( input,length(f) ) );
Y2 = fftshift( fft( y2,length(f) ) );

% % Gráficas
figure(1)
subplot(2,2,1)
plot(n,input);
title('Señal original, x(t)');
xlabel('t [s]');
ylabel('amplitud');
subplot(2,2,3)
plot(f,abs(X));
xlabel('f [hz]');
ylabel('X(f)');
% xlim([-1200 1200]);
title('Señal original, X(f)');

subplot(2,2,2)
plot(n,y1);
% xlim([0 0.025]);
xlabel('t [s]');
ylabel('amplitud');
title('Señal filtrada, y(t)');
subplot(2,2,4)
plot(f,abs(Y1))
xlabel('f [hz]');
ylabel('Y(f)');
% xlim([-1200 1200]);
title('Señal filtrada, Y(f)');



