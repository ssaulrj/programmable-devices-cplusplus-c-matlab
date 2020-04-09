%IMPLEMENTACIÓN DE UN FILTRO FIR MEDIANTE UNA ESTRUCTURA EN CASCADA
%   Structures for Implementing Finite Impulse Response Filters (ALL ABOUT
%   CIRCUITS)

%Filtro IIR pasabajas
%   Chevishev II
%         fs = 8000 Hz
%         fp = 2000 Hz
%         fr = 2100 Hz
%         
%         Ap = 1 dB
%         As = 5 dB

%   Structure:  Direct Form II
%   Order:      5


%Single section filter
b = [0.566021489270347,1.32701706899420,2.05084804552138,2.05084804552138,1.32701706899420,0.566021489270347];
a = [1,1.59481648834791,2.19452892615854,1.78427792409287,0.994003337574404,0.320146531398122];

%Multiple section filter (Para implementación en cascada)
b1 = [1,0.256189781331547,1];
a1 = [1,0.182678773815095,0.861143014079738];

b2 = [1,1.08827433204486,1];
a2 = [1,0.772602670388963,0.581311843017036];

b3 = [1,1,0];
a3 = [1,0.639535044143855,0];

G = [0.905873169361054;0.762210302686220;0.819767522071928;1];

%**********************   FILTRADO POR BLOQUE   **********************

input = 1:5;

%Multiple section filtering (CASCADA)
y_e1 = G(1)*filter(b1,a1,input);
y_e2 = G(2)*filter(b2,a2,y1);
y_e3 = G(3)*filter(b3,a3,y2);

y2 = y_e3;

%**********************   FILTRADO POR MUESTRA   **********************
input = 1:5;

%Matrice de coeficientes 
num = [b1;b2;b3];
den = [a1;a2;a3];
%Vector de ganancias
G = [0.905873169361054;0.762210302686220;0.819767522071928;1];

stages = 3;
u = zeros(stages, 3); 

y_index = 1; %Numera el indice de las muestras de salida
y3 = zeros(1,length(input));

for n = 1:length(input)
    
    x = input(n);
    
    for s = 1:stages
        
        b = num(s,:);
        a = den(s,:);
        
        x = G(s)*x;
        
        temp1 = 0; temp2 = 0; y = 0;

        for k=2:3
            temp1 = temp1 - (a(k)*u(s,k));
            temp2 = temp2 + (b(k)*u(s,k));
        end

        u(s,1) = x + temp1;
        y = (u(s,1)*b(1)) + temp2;

        u(s,3) = u(s,2);
        u(s,2) = u(s,1);
    
        x = y;
        
    end
    
    y3(y_index) = y;
    y_index = y_index +1;
end
