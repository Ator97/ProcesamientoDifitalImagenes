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

%aplicación de filtros paso bajas de bloque Imagen Original
imgOriginalF3 = filter2(f3,imgOriginal);
imgOriginalF5 = filter2(f5,imgOriginal);
imgOriginalF7 = filter2(f7,imgOriginal);
imgOriginalF11 = filter2(f11,imgOriginal);

figure();
subplot(321);imshow(imgOriginal);title('Orginal');
subplot(322);imshow(imgOriginalF3);title('3X3');
subplot(323);imshow(imgOriginalF5);title('5X5');
subplot(324);imshow(imgOriginalF7);title('7X7');
subplot(325);imshow(imgOriginalF11);title('11X11');

%aplicación de filtros paso bajas de bloque Imagen Con ruido
imgRuidoF3 = filter2(f3,imgRuido);
imgRuidoF5 = filter2(f5,imgRuido);
imgRuidoF7 = filter2(f7,imgRuido);
imgRuidoF11 = filter2(f11,imgRuido);

figure();
subplot(321);imshow(imgRuido);title('Con Ruido');
subplot(322);imshow(imgRuidoF3);title('3X3');
subplot(323);imshow(imgRuidoF5);title('5X5');
subplot(324);imshow(imgRuidoF7);title('7X7');
subplot(325);imshow(imgRuidoF11);title('11X11');

%%%%%%%%%%%%%%%%%%%%E3
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

%%%%%%%%%%%%%%%%%%%%E4
%Gaussiano
B = imgaussfilt(A,'FilterSize',3);
B = imgaussfilt(A,'FilterSize',5);
B = imgaussfilt(A,'FilterSize',7);
B = imgaussfilt(A,'FilterSize',11);

%Prewitt en la dirección X 
h = fspecial('prewitt');







