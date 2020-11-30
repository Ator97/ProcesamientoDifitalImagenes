%%%%%%%%%%%%%%%%%%%%E1
%Carga de imagenes
imgOriginal = imread("lenaTest1.png");
imgOriginal = rgb2gray(imgOriginal);
imgOriginal = im2double(imgOriginal);
imgRuido    = imnoise(imgOriginal,"gaussian");

%%%%%%%%%%%%%%%%%%%%E2
%Generación de filtros paso bajas de bloque
f3 = ones(3,3)/9;
f5 = ones(5,5)/25;
f7 = ones(7,7)/49;
f11 = ones(11,11)/121;

%aplicación de filtros paso bajas de bloque Imagen Con ruido
imgRuidoF3 = filter2(f3,imgRuido);
imgRuidoF5 = filter2(f5,imgRuido);
imgRuidoF7 = filter2(f7,imgRuido);
imgRuidoF11 = filter2(f11,imgRuido);

figure();
subplot(321);imshow(imgRuido);title('Con Ruido Paso Bajas de bloque');
subplot(322);imshow(imgRuidoF3);title('3X3');
subplot(323);imshow(imgRuidoF5);title('5X5');
subplot(324);imshow(imgRuidoF7);title('7X7');
subplot(325);imshow(imgRuidoF11);title('11X11');

%%%%%%%%%%%%%%%%%%%%E3
[triangulo,filtoOriginal,factorN,filtroNormalizado] = B(3);
 imgFiltrada= filter2(filtroNormalizado,imgRuido);
 [triangulo2,filtoOriginal2,factorN2,filtroNormalizado2] = B(5);
 imgFiltrada2= filter2(filtroNormalizado2,imgRuido);
 [triangulo3,filtoOriginal3,factorN3,filtroNormalizado3] = B(7);
 imgFiltrada3= filter2(filtroNormalizado3,imgRuido);
 [triangulo4,filtoOriginal4,factorN4,filtroNormalizado4] = B(11);
 imgFiltrada4= filter2(filtroNormalizado4,imgRuido);
 figure;
subplot(321);imshow(imgFiltrada);title('3X3');
subplot(322);imshow(imgFiltrada2);title('5X5');
subplot(323);imshow(imgFiltrada3);title('7X7');
subplot(324);imshow(imgFiltrada4);title('11X11');

%%Llamamos a la funcion de hasta abajo


%%%%%%%%%%%%%%%%%%%%E4
%Bloque [1,-1]
a = imfilter(imgRuido, [1 -1], 'circular');
figure;
imshow(a);title('Filtro de Bloque');


%Prewitt en la dirección X 
Prewitt = fspecial('prewitt');
imgPrewitt= filter2 (Prewitt,imgRuido);
figure();
subplot(111);imshow(imgPrewitt);title('Prewitt Original X');
%Prewitt en la dirección Y 
Prewitt = fspecial('prewitt');
imgPrewitt= filter2 (Prewitt',imgRuido);
figure();
subplot(111);imshow(imgPrewitt);title('Prewitt Original Y');

%Sobel en la dirección X 
Sobel = fspecial('sobel');
imgSobel= filter2 (Sobel,imgRuido);
figure();
subplot(111);imshow(imgSobel);title('Sobel Original X');
%Sober en la dirección Y 
Sobel = fspecial('sobel');
imgSobel= filter2 (Sobel',imgRuido);
figure();
subplot(111);imshow(imgSobel);title('Sobel Original Y');

%Gaussiano
G5 = imgaussfilt(imgRuido,'FilterSize',5);
G7 = imgaussfilt(imgRuido,'FilterSize',7);
G11 = imgaussfilt(imgRuido,'FilterSize',11);
figure();
subplot(321);imshow(imgRuido);title('Original con ruido, Gaussiano');
subplot(323);imshow(G5);title('5X5');
subplot(324);imshow(G7);title('7X7');
subplot(325);imshow(G11);title('11X11');


%%%%%%%%%%%%%%%%%%%%E5
%Laplaciano
laplace = fspecial('laplacian');
imgLaplaceRuido= filter2 (laplace',imgRuido);

figure();
imshow(imgLaplaceRuido);title('Con ruido Laplaciano');

%Segunda derivada Gausiana




%%%%%%%%%%%%%%%%%%%%E6
% Filtro paso bajas de bloque de orden 3x3 y 7x7 (Sin ruido)
f3 = ones(3,3)/9;
imgOriginalF3 = filter2(f3,imgRuido);
imgRecuperada = imsharpen(imgOriginalF3);
subplot(131); imshow(imgRuido);
subplot(132); imshow(imgOriginalF3);
subplot(133); imshow(imgRecuperada);

f7 = ones(7,7)/49;
imgOriginalF7 = filter2(f7,imgRuido);
imgRecuperada = imsharpen(imgOriginalF7);
subplot(131); imshow(imgRuido);
subplot(132); imshow(imgOriginalF7);
subplot(133); imshow(imgRecuperada);


%Filtro paso bajas binomial
[triangulo,filtoOriginal,factorN,filtroNormalizado] = B(3);
imgFiltrada= filter2(filtroNormalizado,imgRuido);
imgRecuperada = imsharpen(imgFiltrada);
subplot(131); imshow(imgRuido);
subplot(132); imshow(imgFiltrada);
subplot(133); imshow(imgRecuperada);


[triangulo3,filtoOriginal3,factorN3,filtroNormalizado3] = B(7);
imgFiltrada3= filter2(filtroNormalizado3,imgRuido);
subplot(131); imshow(imgRuido);
subplot(132); imshow(imgFiltrada3);
subplot(133); imshow(imgRecuperada);




function [triangulo,filtoOriginal,factorN,filtroNormalizado] = B(L)
    x = [1:L+1];
    for i=0 : L
        x(i+1) = factorial(L)/(factorial(L-i)*factorial(i));
    end
    triangulo = x;
    filtoOriginal = triangulo'*triangulo;
    factorN = sum(sum(filtoOriginal));
    filtroNormalizado = filtoOriginal/factorN;
end
