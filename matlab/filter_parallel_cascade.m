%Filtro con estructura paralela

%FILTRO LP Chebyshev 2
% Fp=2000 hz
% Fr=2100 hz
% Fs=8000 hz
% Ap=1 dB
% As= 5db

b=[0.566021489270347 1.32701706899420 2.05084804552138 2.05084804552138 1.32701706899420 0.566021489270347];
a=[1 1.59481648834791 2.19452892615854 1.78427792409287 0.994003337574404 0.320146531398122];
[r,p,k]=residue(b,a); %Transforma en fracciones parciales de orden 1

r %residuo
p %polos
k %ganancia de expansion

[b1,a1]= residue(r(1:2),p(1:2),k);

b1
a1

[b2,a2]= residue(r(3:4),p(3:4),0); %sumar parte imaginaria
o
b2
a2

%[b3,a3]= residue(r(5),p(5),0);

%%Filtrado por etapas (en cascada)
bb1 = [1,-1.86703714843178;
	1,-1.83304372057405;
	1,-1.86290671917796;
	1,-1.83803615643156;
	1,-1.85545163975979;
	1,-1.84635364418978];

aa1 = [1,-1.79547056311058,0.978605313644745;
	1,-1.86389168014053,0.982609721436526;
	1,-1.77406558911600,0.943956962064352;
	1,-1.82786970833642,0.951749274762659;
	1,-1.77514727854176,0.927449577804181;
	1,-1.79560202274889,0.931295308477164];

gg1 = [0.989639913440320;
	0.989639913440320;
	0.973572681851168;
	0.973572681851168;
	0.964638725084316;
	0.964638725084316];


Ne = length(aa1(:,1));
uu1 = zeros(Ne, 3);

for n1 = 1:Nx
    x(1) = input_sample(n1);
    
    for e = 1:Ne
        temp1 = 0;
        temp2 = 0;
        for k = 2:3
            temp1 = temp1 - aa1(e,k)*uu1(e,k);
            temp2 = temp2 - bb1(e,k)*uu1(e,k);
        end
        
        uu1(e,1) = ( (gg1(e)*x) + temp1 ); //x+temp1
        ye = uu1(e,1)*bb1(e,1)+ temp2;
        
        for m = 3:-1:2
            uu1(e,m) = uu1(e,m-1);
        end;
        yr=yr+y; % agregada
        x = ye;
    end
    
    yiir_cascada1(1,n) = ye;
    
    disp('Implementación en cascada');
    ye
    yy  
end
