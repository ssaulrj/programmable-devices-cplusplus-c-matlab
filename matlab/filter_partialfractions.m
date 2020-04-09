clear all
close all
clc

B = [0.218233330961176,-1.78140888665774,6.87428089541769,-16.4583522908687,27.0185303915765,-31.7424513352552,27.0185303915765,-16.4583522908687,6.87428089541769,-1.78140888665774,0.218233330961176];
A = [1,-5.51729648322210,15.0393884944374,-26.1159736868011,31.6628785993704,-27.8196963484227,17.8604500374718,-8.24852766320847,2.61746582509021,-0.514760001325120,0.0476257868697205];

%Calculamos la espansión en fracciones parciales

[r,p,k]=residue(B,A);  

%PRIMER par H1(z)
[b1,a1]=residue(r(1:2),p(1:2),k);

%SEGUNDO par H2(Z)
[b2,a2]=residue(r(3:4),p(3:4),0);

%TERCER par H3(z)
[b3,a3]=residue(r(5:6),p(5:6),0);

%CUARTO par H4(Z)
[b4,a4]=residue(r(7:8),p(7:8),0);

%QUINTO par H5(z)
[b5,a5]=residue(r(9:10),p(9:10),0);

bb = real([b1;0 b2;0 b3;0 b4;0 b5])
aa = real([a1; a2; a3; a4; a5])

input = 1:10;
y2 = filter(B,A,input);

estapas = 5;
u = zeros(estapas, 3); 

indx = 1; %Numera el indice de las muestras de salida

y1 = zeros(1,length(input));

for n = 1:length(input) 
    
    x = input(n);
    y = 0;
    
    for e = 1:estapas
        
        b = bb(e,:);
        a = aa(e,:);
        
        temp1 = 0; temp2 = 0;

        for k=2:3
            temp1 = temp1 - (a(k)*u(e,k));
            temp2 = temp2 + (b(k)*u(e,k));
        end

        u(e,1) = x + temp1;
        
        for m=3:-1:2
            u(e,m) = u(e,m-1);
        end
        
        y_e = (u(e,1)*b(1)) + temp2;
        
        %Acumulamos en y la salida de las N etapas
        y = y + y_e;
    end
    y1(indx) = y;
    indx = indx +1;
    
    y2
    y
    
    pause();
end
