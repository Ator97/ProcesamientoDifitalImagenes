image = imread('pentagon256x256.tif');
%Ejercicio 1:
S_T2 = zeros(size(image,2)*2);

for x = 1:size(image,2)
    for y = 1:size(image,2)
        S_T2(2*x-1,2*y-1) = image(x,y);
    end
end

%Sobremuestreo con T=4::
S_T4 = zeros(size(image,2)*4);

for x = 1:size(image,2)
    for y = 1:size(image,2)
        S_T4(4*x-3,4*y-3) = image(x,y);
    end
end

%Para que se vean bien, se maximiza la ventana emergente.
subplot(1,3,1),imshow(image,[]),title('Imagen original')
subplot(1,3,2),imshow(S_T2,[]),title('T = 2')
subplot(1,3,3),imshow(S_T4,[]),title('T = 4')
%frecuencia
figure('Name','Sobremuestreo en frecuencia.'),
subplot(1,3,1),imshow(fftshift(log(abs(fft2(image)))),[]),title('Imagen original')
subplot(1,3,2),imshow(fftshift(log(abs(fft2(S_T2)))),[]),title('T = 2')
subplot(1,3,3),imshow(fftshift(log(abs(fft2(S_T4)))),[]),title('T = 4')
input("Presiona enter para continuar.");

%Ejercicio 2:
f_2 = ones(2);
f_4 = ones(4);
temp = conv2(S_T2,f_2,'full');
Z_T2 = temp(1:size(S_T2,2),1:size(S_T2,2));
temp = conv2(S_T4,f_4,'full');
Z_T4 = temp(1:size(S_T4,2),1:size(S_T4,2));

figure('Name','Orden cero.'),
subplot(1,2,1),imshow(Z_T2,[]),title('T = 2')
subplot(1,2,2),imshow(Z_T4,[]),title('T = 4')

%Despliegue en frecuencia.
figure('Name','Orden cero en frecuencia.'),
subplot(1,2,1),imshow(fftshift(log(abs(fft2(Z_T2)))),[]),title('T = 2')
subplot(1,2,2),imshow(fftshift(log(abs(fft2(Z_T4)))),[]),title('T = 4')

%Filtro para T=2.
f_2 = [1/2 1 1/2]'*[1/2 1 1/2];
%Filtro para T=4:
f_4 = [1/4 1/2 3/4 1 3/4 1/2 1/4]'*[1/4 1/2 3/4 1 3/4 1/2 1/4];
%Lineal para T=2:
temp = conv2(S_T2,f_2,'full');
L_T2 = temp(1:size(S_T2,2),1:size(S_T2,2));
%Lineal para T=4:
temp = conv2(S_T4,f_4,'full');
L_T4 = temp(1:size(S_T4,2),1:size(S_T4,2));
figure('Name','Interpolación lineal.'),
subplot(1,2,1),imshow(L_T2,[]),title('T = 2')
subplot(1,2,2),imshow(L_T4,[]),title('T = 4')
%Despliegue en frecuencia.
figure('Name','Interpolación de orden cero en frecuencia.'),
subplot(1,2,1),imshow(fftshift(log(abs(fft2(L_T2)))),[]),title('T = 2')
subplot(1,2,2),imshow(fftshift(log(abs(fft2(L_T4)))),[]),title('T = 4')

%Ejercicio 3:
Interpolacion_frecuencia = fft2(image);
%Despliegue de espectros, centrado y no centrado.
figure('Name','Ejercicio 3:   DFT de la imagen original.'),
subplot(1,2,1),imshow(log(abs(Interpolacion_frecuencia)),[])
subplot(1,2,2),imshow(fftshift(log(abs(Interpolacion_frecuencia))),[])
aux = fftshift(Interpolacion_frecuencia);
%Interpolación en frecuencia con T=2:
%Padding de ceros, con la dft en el centro
I_frec_t2 = complex(zeros(size(image,2)*2));
I_frec_t2(size(image,2)/2+1:size(image,2)+size(image,2)/2,size(image,2)/2+1:size(image,2)+size(image,2)/2) = aux;
%I_frec_t2(129:384,129:384) = temp; es lo mismo de arriba.
I_frec_t2_final = ifft2(I_frec_t2);
%Padding de ceros, con la dft en el centro
I_frec_t4 = complex(zeros(size(image,2)*4));
I_frec_t4(385:640,385:640) = aux;
I_frec_t4_final = ifft2(I_frec_t4);
%Despliegue de las DFT con el padding
figure('Name','Ejercicio 3:   DFT tras interpolación en frecuencia.'),
subplot(1,2,1),imshow(log(abs(I_frec_t2)),[]),title('T=2')
subplot(1,2,2),imshow(log(abs(I_frec_t4)),[]),title('T=4')
%Comparativa de las DFT del ejercicio 2 y 3, T=2.
figure('Name','Comparando DFT cuando T=2.'),
subplot(2,2,1),imshow(fftshift(log(abs(fft2(Z_T2)))),[]),title('DFT orden cero.')
subplot(2,2,2), imshow(log(abs(I_frec_t2)),[]),title('Interpolación en frecuencia')
subplot(2,2,4), imshow(fftshift(log(abs(fft2(L_T2)))),[]),title('DFT lineal')
%Comparativa de las DFT del ejercicio 2 y 3, T=4.
figure('Name','Ejercicio 3:   Comparativa DFT con T=4.'),
subplot(2,2,1),imshow(fftshift(log(abs(fft2(Z_T4)))),[]),title('DFT orden cero.')
subplot(2,2,2),imshow(log(abs(I_frec_t4)),[]),title('Interpolación en frecuencia')
subplot(2,2,4),imshow(fftshift(log(abs(fft2(L_T4)))),[]),title('DFT lineal')
%Interpolación en frecuencia, resultado de la ifft2:
figure('Name','Ejercicio 3:   IDFT de la interpolación en frecuencia.'),
subplot(1,2,1),imshow(abs(I_frec_t2_final),[]),title('T = 2')
subplot(1,2,2),imshow(abs(I_frec_t4_final),[]),title('T = 4')

%Ejercicio 4:
%Despliegue para T=2.
figure('Name','Ejercicio 4:   Comparativa interpolación con T=2.'),
subplot(2,2,1),imshow(Z_T2,[]),title('Orden cero')
subplot(2,2,2),imshow(L_T2,[]),title('Lineal')
subplot(2,2,4),imshow(abs(I_frec_t2_final),[]),title('En frecuencia')
%Despliegue para T=4.
figure('Name','Ejercicio 4:   Comparativa interpolación con T=4.'),
subplot(2,2,1),imshow(Z_T4,[]),title('Orden cero')
subplot(2,2,2),imshow(L_T4,[]),title('Lineal')
subplot(2,2,4),imshow(abs(I_frec_t4_final),[]),title('En frecuencia')