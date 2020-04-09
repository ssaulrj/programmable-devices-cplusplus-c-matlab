clear all;

a = [1,-8.68272213388058,34.0039664867256,-79.0888144919999,120.970896705975,-127.133693794856,92.9633981854144,-46.6989365275176,15.4220075621785,-3.02323676098716,0.267134915133097];

b = [0.000921054767010914,-0.00741840867608949,0.0278383367508438,-0.0646061257918662,0.103554346919629,-0.120578261753791,0.103554346919629,-0.0646061257918662,0.0278383367508438,-0.00741840867608949,0.000921054767010914];

Fs = 16000;
n = 0:1/Fs:0.1;
f = -Fs/2:Fs/1024:(Fs/2)-(Fs/1024);


input_sample = sin(2*pi*500*n) + sin(2*pi*750*n) + sin(2*pi*1000*n);
z = 1;
[r,p,k] = residue(b,a);
X = fftshift(fft(input_sample,1024));
b1 = zeros(5,3);
y = 0;

for n = 1:5
    
    if n == 1
        [b1(n,[1 2 3]),a1(n,[1 2 3])]  = residue(r(z:z+1),p(z:z+1),k);
    else
      
        [b1(n,[1 2 3]),a1(n,[1 2 3])]  = residue(r(z:z+1),p(z:z+1),0.000000000000000000000000000001);  
    end
    z = z+2;
    
end

aa1 = real(a1)
bb1 = real(b1)

G = zeros(1,5);
xs = 0;
Nx = length(input_sample);
Ne = length(aa1(:,1));
uu1 = zeros(Ne,3);
Na = length(aa1(1,:));
u=zeros(1,Na);

yy = 0;


for pp = 1:Ne
    tic
    for n=1:Nx
        x(1)=input_sample(n);
        temp1=0; temp2=0;
        for k=2:Na
            temp1=temp1-(aa1(pp,k)*u(k));
            temp2=temp2+(bb1(pp,k)*u(k));
        end
        u(1)= x(1)+temp1;
        y(n)=(u(1)*bb1(pp,1))+temp2;
        for m=Na:-1:2
            u(m)=u(m-1);
        end

        
        %pause;
    end
    toc
    yy = yy + y;
end

%yy = filter(b,a,input_sample);

Y = fftshift(fft(yy,1024));

n = 0:1/Fs:0.1;

figure(1)
subplot(2,1,1)
plot(n,input_sample);xlim([0 0.1]);
title('Señal senoidal')
subplot(2,1,2)
plot(n,yy);xlim([0 0.1]);
title('Señal senoidal filtrada IIR')


figure(2)
subplot(2,1,1)
plot(f,abs(X));
title('Espectro Señal senoidal')
subplot(2,1,2)
plot(f,abs(Y));
title('Espectro Señal senoidal filtrada IIR')

